require "./models/item.rb"

class ItemController
    def create_item(params)
        item = Item.new(
            id: params["id"],
            name: params["name"],
            price: params["price"],
            category: params["category"]
        )
        item.create
    end

    def get_all_items()
        items = Item.get_with_categories
        rendered = ERB.new(File.read("./views/list_item.erb"))
        rendered.result(binding)
    end
end