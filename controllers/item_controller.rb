require "./models/item.rb"

class ItemController
    def create_item(params)
        item = Item.new(
            id: params["id"],
            name: params["name"],
            price: params["price"],
            category: params["category"]
        )
        item.save

        get_with_categories()
    end

    def get_with_categories()
        items = Item.get_with_categories
        rendered = ERB.new(File.read("./views/list_item.erb"))
        rendered.result(binding)
    end

    def show_create_form()
        rendered = ERB.new(File.read("./views/create_item.erb"))
        rendered.result(binding)
    end

    def detail(params)
        id = params["id"]
        item = Item.get_with_category(id)
        category = item.category
      
        rendered = ERB.new(File.read("./views/detail_item.erb"))
        rendered.result(binding)
    end

    def delete(params)    
        id = params["id"]
        Item.delete(id)
    end
end