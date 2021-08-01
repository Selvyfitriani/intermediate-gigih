require_relative "./../db/db_connector"

class ItemCategory
    def initialize(item_id, category_id)
        @item_id = item_id
        @category_id = category_id
    end

    def save
        client = create_db_client
        client.query(
            "INSERT INTO item_categories(item_id, category_id) " +
            "values (#{@item_id}, #{@category_id})"
        )
    end

    def find_all_by_item_id(id)
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

    def parse_json(json)
        item_category = ItemCategory.new(json["item_id"], json["category_id"])
        item_category
    end
end