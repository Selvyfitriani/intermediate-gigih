require_relative "./../models/category"

class CategoryController
    def self.find_all_by_item_categories(item_categories)
        categories = Category.find_all_by_item_categories(item_categories)
        categories
    end

    def get_all()
        categories = Category.get_all
        
        rendered = ERB.new(File.read("./views/list_category.erb"))
        rendered.result(binding)
    end

    def self.get_all_id()
        all_id = Category.get_all_id()
        all_id
    end
end