require "./models/item.rb"

class ItemController
    def create_item(params)
        item = Item.new({
            id: params["id"],
            name: params["name"],
            price: params["price"]
        })
        item.save
    end

    def get_all_with_categories
        items = Item.get_all_with_categories
        rendered = ERB.new(File.read("./views/list_item.erb"))
        rendered.result(binding)
    end

    def show_create_form()
        rendered = ERB.new(File.read("./views/create_item.erb"))
        rendered.result(binding)
    end

    def detail(params)
        item = Item.detail_with_category(params["id"])
        category = item.category
      
        rendered = ERB.new(File.read("./views/detail_item.erb"))
        rendered.result(binding)
    end

    def show_update_form(params)
        item = Item.detail_with_category(params["id"])
        categories = Category.get_all()

        rendered = ERB.new(File.read("./views/update_item.erb"))
        rendered.result(binding)
    end

    def update(params)
        Item.update(params["id"], params["name"], params["price"], params["category"])
    end

    def delete(params)    
        Item.delete(params["id"])
    end
end