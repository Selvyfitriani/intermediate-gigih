require_relative "./../controllers/item_category_controller"
require_relative "./../controllers/category_controller"
require_relative "./../models/item"
require_relative "./../models/category"
require_relative "./../models/item_category"

class ItemController
    def get_all
        items = Item.get_all
        rendered = ERB.new(File.read("./views/list_item.erb"))
        rendered.result(binding)
    end

    def detail(params)
        item = Item.detail_with_category(params["id"])
        categories = item.categories.
    
        rendered = ERB.new(File.read("./views/detail_item.erb"))
        rendered.result(binding)
    end

    def delete(params)    
        Item.delete(params["id"])
    end

    def show_create_form
        categories = Category.get_all
        rendered = ERB.new(File.read("./views/create_item.erb"))
        rendered.result(binding)
    end

    def create_item(params)
        item = Item.new(name=params["name"], price=params["price"])
        item.save

        # save item categories that corresponding to the sitem
        item_id = Item.get_last_insert_id
        ItemCategoryController.save_item_categories(item_id, params)
    end
    
    # ongoing
    def show_update_form(params)
        item = Item.detail_with_category(params["id"])
        item_categories_id = ItemCategoryController.get_all_category_id_by_item(params["id"])
        all_categories = Category.get_all

        rendered = ERB.new(File.read("./views/update_item.erb"))
        rendered.result(binding)
    end
    # belum
    
    def update(params)
        Item.update(params["id"], params["name"], params["price"], params["category"])
    end

  
end