require_relative "./../db/db_connector"
require_relative "./../models/item_category"
require 'bigdecimal'

class Item
    attr_accessor :id, :name, :price, :categories

    def initialize(id=nil, categories=nil, name, price)
        @id = id
        @name = name
        @price = price
        @categories = categories
    end

    def self.get_all
        client = create_db_client
        raw_data = client.query("SELECT * FROM items")
        items = Array.new
        raw_data.each do |datum|
            item = json_parse(datum)
            items.push(item)
        end
        items
    end
    
    def self.json_parse(json)
        item = Item.new(json["id"],  nil,  json["name"], BigDecimal(json["price"]).to_s("F"))
        item
    end

    # belum
    def self.get_all_with_categories
        client = create_db_client()
        get_items_query =   "SELECT items.*, categories.id AS 'category_id', categories.name AS 'category_name'
                            FROM items
                            LEFT JOIN item_categories ON items.id = item_categories.item_id
                            LEFT JOIN categories ON item_categories.category_id = categories.id
                            "
        raw_data = client.query(get_items_query)
        items = Array.new
        raw_data.each do |datum|
            item = parse_from_json(datum)
            items.push(item)
        end
    
        items 
    end

    def save
        client = create_db_client()
        create_item_query = "INSERT INTO items(name, price) values " + 
                            "('#{name}', #{price})"
        id = get_last_insert_id
   
        if categories_id.length > 0
            categories_id.each do |category_id|
               ItemCategory.new(id, category_id).save
            end
        end
    end

    def get_last_insert_id
        client = create_db_client()
        get_last_id_query = "SELECT MAX(id) as id FROM items"
        raw_data = client.query(get_last_id_query)

        raw_data.each do |datum|
            return datum["id"].to_i
        end    
    end

    def self.update(id, name, price, category_id)
        client = create_db_client()
        update_item_query = "UPDATE items SET name='#{name}', price=#{price} WHERE id=#{id}"

        select_category_query = "SELECT * FROM item_categories WHERE item_id=#{id}"
        item_categories = client.query(select_category_query)
        item_categories.each do |item|
            puts(item.nil?)
        end
        
        if !category_id.nil?
            update_category_query = "UPDATE item_categories SET category_id=#{category_id} WHERE item_id=#{id}"
            client.query(update_category_query)
        else
            insert_category_query = "INSERT INTO item_categories(item_id, category_id) values (#{id}, #{category_id})"
            puts(insert_category_query)
            client.query(insert_category_query)
        end

        client.query(update_item_query)     
    end
    
    def delete
        client = create_db_client()
        delete_item_query = "DELETE FROM items WHERE id=#{id}"
        client.query(delete_item_query)
    end
   

    def self.parse_from_json(json)
        category = Category.new(json["category_id"], json["category_name"])
        puts(json)
        item = Item.new(json["id"],  category,  json["name"], BigDecimal(json["price"]).to_s("F"))
        
        item
    end

    def self.get_cheaper_than(price)
        client = create_db_client()
        get_items_cheaper_query = "SELECT * FROM items
                                  where price < #{price}"
        raw_data = client.query(get_items_cheaper_query)
    
        items = Array.new
        raw_data.each do |datum|
            item = Item.new(json["id"],  category,  json["name"], BigDecimal(json["price"]).to_s("F"))
            items.push(item)
        end
    
        items 
    end
    
    def self.detail(id)
        client = create_db_client
        raw_data = client.query("SELECT * FROM items WHERE id=#{id}")
        item = json_parse(raw_data)
        item    
    end

    def self.detail_with_category(item_id)
        client = create_db_client()
        get_item_query =   "SELECT items.*, categories.id AS 'category_id', categories.name AS 'category_name'
                            FROM items
                            LEFT JOIN item_categories ON items.id = item_categories.item_id
                            LEFT JOIN categories ON item_categories.category_id = categories.id
                            WHERE items.id = #{item_id}
                            "
        raw_data = client.query(get_item_query)
    
        item = nil
        raw_data.each do |datum|
            category = Category.new(datum["category_id"], datum["category_name"])
            item = Item.new(json["id"],  category,  json["name"], BigDecimal(json["price"]).to_s("F"))
        end
    
        item
    end
end