require 'sinatra'
require 'json'
require_relative './db/db_connector'
require_relative './models/item'
require_relative './controllers/item_controller'
require_relative './controllers/category_controller'


# items routing
get '/items' do 
    controller = ItemController.new
    controller.get_all
end

get '/items/detail/:id' do
    controller = ItemController.new
    controller.detail(params)
end

get '/items/delete/:id' do
    controller = ItemController.new
    controller.delete(params)
    
    redirect '/items'
end

get '/items/create' do
    controller = ItemController.new
    controller.show_create_form
end

post '/items/create' do
    controller = ItemController.new
    controller.create_item(params)

    redirect '/items'
end

get '/items/update/:id' do
    controller = ItemController.new
    controller.show_update_form(params)
end

post '/items/update' do
    controller = ItemController.new
    controller.update(params)

    redirect "/items/detail/#{params["id"]}"
end

# categories routing
get '/categories' do
    controller = CategoryController.new
    controller.get_all
end