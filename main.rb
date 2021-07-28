require 'sinatra'
require './db/db_connector'
require 'json'
require './models/item'
require './controllers/item_controller'

get '/items' do 
    controller = ItemController.new
    controller.get_with_categories()
end

get '/items/create' do
    controller = ItemController.new
    controller.show_create_form()
end

post '/items/create' do
    controller = ItemController.new
    controller.create_item(params)
end

get '/items/detail/:id' do
    controller = ItemController.new
    controller.detail(params)
end

get '/items/delete' do
    controller = ItemController.new
    controller.delete(params)
    
    redirect '/items'
end

get '/items/update' do
    id = params["id"]
    item = Item.get_with_category(id)
    categories = Category.get_all()
    erb :update_item, locals: {
        item: item,
        categories: categories
    }
end

post '/items/update' do
    id = params["id"]
    name = params["name"]
    price = params["price"]
    category_id = params["category"]
    Item.update(id, name, price, category_id)

    redirect "/items/detail?id=#{id}"
end