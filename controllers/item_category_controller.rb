require_relative "./../controllers/item_controller"
require_relative "./../models/category"
require_relative "./../models/item_category"

class ItemCategoryController
    def self.find_all_by_item_id(params)
        item_categories = ItemCategory.find_all_by_item_id(params["id"])
        item_categories
    end

    def self.save_item_categories(item_id, params)
        categories_id = Array.new
        params.each_key do |key|
            category_id = key.to_i
            if category_id > 0
                categories_id.push(category_id)
            end
        end
        ItemCategory.save_item_categories(item_id, categories_id)
    end
   
    def self.get_all_category_id_by_item(item_id)
        return ItemCategory.get_all_category_id_by_item(item_id)
    end

    def get_all_item_by_category_id(category_id)
        category = Category.find_by_id(category_id)
        items_id = ItemCategory.get_all_item_id_by_category_id(category_id)
        items = Array.new
        items_id.each do |item_id|
            item = Item.detail(item_id)
            items.push(item)
        end
        
        rendered = ERB.new(File.read("./views/list_item_by_category.erb"))
        rendered.result(binding) 
    end

    def self.update(item_id, categories_id)
        ItemCategory.update(item_id, categories_id)
    end
end