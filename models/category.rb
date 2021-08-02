class Category
    attr_accessor :id, :name

    def initialize(id, name)
        @id = id
        @name = name
    end

    def self.find_all_by_item_categories(item_categories)
        client = create_db_client
        categories = Array.new
        item_categories.each do |item_category|
            category = find_by_id(item_category.category_id)
            categories.push(category)
        end

        categories
    end

    def self.find_by_id(id)
        client = create_db_client
        raw_data = client.query("SELECT * FROM categories WHERE id=#{id}")
        raw_data.each do |datum|
            category = json_parse(datum)
            return category
        end
    end

    def self.json_parse(json)
        category = Category.new(json["id"], json["name"])
        category
    end

    # ongoing
    def self.get_all_id
        client = create_db_client
        
        raw_data = client.query("SELECT id FROM categories")

        all_id = Array.new
        raw_data.each do |datum|
            all_id.push(datum["id"].to_i)
        end
     
        all_id
    end

    # belum

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

   

    def self.get_by_ids(ids)
        client = create_db_client
        categories = Array.new

        ids.each do |id|
            category = find_by_id(id)
            categories.push(category)
        end

        categories
    end

  

  
    
end

