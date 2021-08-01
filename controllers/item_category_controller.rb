require_relative "./../models/item_category"

class ItemCategoryController
    def self.find_all_by_item_id(item_id)
        item_categories = ItemCategory.find_all_by_item_id(params["id"])
        item_categories
    end
end