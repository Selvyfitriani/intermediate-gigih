require_relative "./../db/db_connector"
require_relative "./../controllers/item_category_controller"
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

    def self.detail(id)
        client = create_db_client
        raw_data = client.query("SELECT * FROM items WHERE id=#{id}")

        raw_data.each do |datum|
            item = json_parse(datum)
            return item
        end
    end   

    def self.delete(id)
        client = create_db_client()
        delete_item_query = "DELETE FROM items WHERE id=#{id}"
        client.query(delete_item_query)
    end

    def save
        client = create_db_client()
        create_item_query = "INSERT INTO items(name, price) values " + 
                            "('#{name}', #{price})"
        client.query(create_item_query)
    end

    def self.get_last_insert_id
        client = create_db_client()
        get_last_id_query = "SELECT MAX(id) as id FROM items"
        raw_data = client.query(get_last_id_query)

        raw_data.each do |datum|
            return datum["id"].to_i
        end    
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
    
        categories = Array.new

        raw_data.each do |datum|
            category = Category.new(datum["category_id"], datum["category_name"])
            categories.push(category)
        end

        # iterate once again to get id, name, and price
        raw_data.each do |datum|
            item = Item.new(datum["id"],  categories,  datum["name"], BigDecimal(datum["price"]).to_s("F"))
            return item
        end
    end
    
    def self.update(id, categories_id, name, price)
        # update item
        client = create_db_client()
        update_item_query = "UPDATE items SET name='#{name}', price=#{price} WHERE id=#{id}"

        # update all item categories related to item
        ItemCategoryController.update(id, categories_id)
    end
end