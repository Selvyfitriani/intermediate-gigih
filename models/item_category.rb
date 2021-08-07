require_relative "./../db/db_connector"

class ItemCategory
    attr_accessor :item_id, :category_id
    
    def initialize(item_id, category_id)
        @item_id = item_id
        @category_id = category_id
    end

    def self.find_all_by_item_id(id)
        client = create_db_client
        raw_data = client.query(
            "SELECT * FROM item_categories WHERE item_id = #{id}"
        )
      
        item_categories = Array.new
        raw_data.each do |datum|
            item_category = parse_json(datum)
            item_categories.push(item_category)
        end

        item_categories
    end

    def self.parse_json(json)
        item_category = ItemCategory.new(json["item_id"], json["category_id"])
        item_category
    end

    def self.save_item_categories(item_id, categories_id)
        categories_id.each do |category_id|
            item_category = ItemCategory.new(item_id, category_id)
            item_category.save
        end
    end
    
    def save
        client = create_db_client
        client.query(
            "INSERT INTO item_categories(item_id, category_id) " +
            "values (#{@item_id}, #{@category_id})"
        )
    end
    
    def self.get_all_category_id_by_item(item_id)
        client = create_db_client 
        raw_data = client.query("SELECT category_id FROM item_categories WHERE item_id=#{item_id}")

        categories_id = Array.new
        raw_data.each do |datum|
            category_id = datum["category_id"].to_i
            categories_id.push(category_id)
        end

        categories_id
    end

    def self.get_all_item_id_by_category_id(category_id)
        client = create_db_client 
        raw_data = client.query("SELECT item_id FROM item_categories WHERE category_id=#{category_id}")

        items_id = Array.new
        raw_data.each do |datum|
            item_id = datum["item_id"].to_i
            items_id.push(item_id)
        end

        items_id
    end

    def self.update(item_id, categories_id)
        # delete all categories id related to item id
        client = create_db_client
        client.query("DELETE FROM item_categories where item_id=#{item_id}")

        # insert all categories id related to item id
        categories_id.each do |category_id|
            client.query("INSERT INTO item_categories(item_id, category_id) values (#{item_id}, #{category_id})")
        end
    end

    def self.delete_all_item_categories_by_category(category_id)
        client = create_db_client
        client.query("DELETE FROM item_categories WHERE category_id=#{category_id}")
    end
end