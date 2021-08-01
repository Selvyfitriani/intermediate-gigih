require_relative "./../models/category"

class CategoryController
    def self.find_all_by_item_categories(item_categories)
        categories = Category.find_all_by_item_categories(item_categories)
        categories
    end
    # ongoing
    
    #  belum
end