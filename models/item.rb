require 'bigdecimal'

class Item
    attr_accessor :id, :name, :price, :category

    def initialize(params)
        @id = params[:id]
        @name = params[:name]
        @price = params[:price]
        @category = params[:category]
    end

    def save
        client = create_db_client()
        create_item_query = "INSERT INTO items(name, price) values
                            ('#{name}', '#{price}')"
        client.query(create_item_query)
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
    
    def self.get_all_with_categories
        client = create_db_client()
        get_items_query =   "SELECT items.*, categories.id AS 'category_id', categories.name AS 'category_name'
                            FROM items
                            LEFT JOIN item_categories ON items.id = item_categories.item_id
                            LEFT JOIN categories ON item_categories.category_id = categories.id
                            "
        rawData = client.query(get_items_query)
    
        items = Array.new
        rawData.each do |datum|
            category = Category.new(datum["category_id"], datum["category_name"])
            item = Item.new({
                id: datum["id"],
                name: datum["name"],
                price: BigDecimal(datum["price"]).to_s("F"),
                category: category
            })
            items.push(item)
        end
    
        items 
    end
    
    def self.get_cheaper_than(price)
        client = create_db_client()
        get_items_cheaper_query = "SELECT * FROM items
                                  where price < #{price}"
        rawData = client.query(get_items_cheaper_query)
    
        items = Array.new
        rawData.each do |datum|
            item = Item.new({
                id: datum["id"],
                name: datum["name"],
                price: BigDecimal(datum["price"]).to_s("F"),
                category: category
            })
            items.push(item)
        end
    
        items 
    end
    
    
    def self.detail_with_category(item_id)
        client = create_db_client()
        get_item_query =   "SELECT items.*, categories.id AS 'category_id', categories.name AS 'category_name'
                            FROM items
                            LEFT JOIN item_categories ON items.id = item_categories.item_id
                            LEFT JOIN categories ON item_categories.category_id = categories.id
                            WHERE items.id = #{item_id}
                            "
        rawData = client.query(get_item_query)
    
        item = nil
        rawData.each do |datum|
            category = Category.new(datum["category_id"], datum["category_name"])
            item = Item.new({
                id: datum["id"],
                name: datum["name"],
                price: BigDecimal(datum["price"]).to_s("F"),
                category: category
            })
        end
    
        item
    end
end