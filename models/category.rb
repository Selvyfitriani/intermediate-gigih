class Category
    attr_accessor :id, :name

    def initialize(id, name)
        @id = id
        @name = name
    end

    def self.get_all
        client = create_db_client()
        get_categories_query = "SELECT * FROM categories"
        rawData = client.query(get_categories_query)
    
        categories = Array.new
        rawData.each do |datum|
            category = Category.new(datum["id"], datum["name"])
            categories.push(category)
        end
        
        categories
    end

    def self.get_ids
        client = create_db_client
        
        rawData = client.query("SELECT id FROM categories")

        ids = Array.new
        rawData.each do |datum|
            ids.push(datum["id"])
        end
     
        ids
    end
end

