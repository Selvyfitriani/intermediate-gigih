class Category
    attr_accessor :id, :name

    def initialize(id, name)
        @id = id
        @name = name
    end

    def self.get_all
        client = create_db_client()
        get_categories_query = "SELECT * FROM categories"
        raw_data = client.query(get_categories_query)
    
        categories = Array.new
        raw_data.each do |datum|
            category = Category.new(datum["id"], datum["name"])
            categories.push(category)
        end
        
        categories
    end

    def self.get_ids
        client = create_db_client
        
        raw_data = client.query("SELECT id FROM categories")

        ids = Array.new
        raw_data.each do |datum|
            ids.push(datum["id"])
        end
     
        ids
    end

    def self.get_by_ids(ids)
        client = create_db_client
        categories = Array.new

        ids.each do |id|
            category = find_by_id(id)
            categories.push(category)
        end

        puts(categories)
        categories
    end

    def self.find_by_id(id)
        client = create_db_client
        raw_data = client.query("SELECT * FROM categories WHERE id=#{id}")
        raw_data.each do |datum|
            category = Category.new(datum["id"], datum["name"])
            return category
        end
    end

    def self.find_by_item_categories(item_categories)
        client = create_db_client
        categories = Array.new

        item_categories.each do |item_category|
            category = find_by_id(item_category["category_id"])
            categories.push(category)
        end

        return categories
    end
    
end

