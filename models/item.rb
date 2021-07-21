class Item
    attr_accessor :id, :name, :price, :category

    def initialize(id, name, price, category=nil)
        @id = id
        @name = name
        @price = price
        @category = category
    end

    def self.create_new_item
        client = create_db_client()
        create_item_query = "INSERT INTO items(name, price) values
                            ('#{name}', #{price})"
        client.query(create_item_query)
    end

    def self.get_item(id)
        client = create_db_client()
        get_item_query = "SELECT * FROM items WHERE id=#{id}"
        rawData = client.query(get_item_query)
        item = nil
        rawData.each do |datum|
            item = Item.new(datum["id"], datum["name"], BigDecimal(datum["price"]).to_s("F"))
        end
        item
    end

    def self.update_item
        client = create_db_client()
        update_item_query = "UPDATE items SET name='#{name}', price=#{price} WHERE id=#{id}"
        update_category_query = "UPDATE item_categories SET category_id=#{category_id} WHERE item_id=#{id}"
        puts(update_item_query)
        puts(update_category_query)
        client.query(update_item_query)
        client.query(update_category_query)
    end
    
    def self.delete_item
        client = create_db_client()
        delete_item_query = "DELETE FROM items WHERE id=#{id}"
        client.query(delete_item_query)
    end
    
    def self.get_all_item_with_categories
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
            item = Item.new(datum["id"], datum["name"], BigDecimal(datum["price"]).to_s("F"), category)
            items.push(item)
        end
    
        items 
    end
    
    def self.get_items_cheaper_than
        client = create_db_client()
        get_items_cheaper_query = "SELECT * FROM items
                                  where price < #{price}"
        rawData = client.query(get_items_cheaper_query)
    
        items = Array.new
        rawData.each do |datum|
            item = Item.new(datum["id"], datum["name"], BigDecimal(datum["price"]).to_s("F"))
            items.push(item)
        end
    
        items 
    end
    
    
    def self.get_item_with_category
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
            item = Item.new(datum["id"], datum["name"], BigDecimal(datum["price"]).to_s("F"), category)
        end
    
        item
    end
end