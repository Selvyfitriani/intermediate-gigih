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
end