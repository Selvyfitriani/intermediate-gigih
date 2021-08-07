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

get '/categories/create' do
    controller = CategoryController.new
    controller.show_create_form
end

post '/categories/create' do
    controller = CategoryController.new
    controller.create_category(params)

    redirect '/categories'
end

get '/categories/delete/:id' do
    controller = CategoryController.new
    controller.delete(params)
    
    redirect '/categories'
end

get '/categories/all-items/:id' do
    controller = ItemCategoryController.new
    items = controller.get_all_item_by_category_id(params["id"])
end

get '/categories/update/:id' do
    controller = CategoryController.new
    controller.show_update_form(params)
end

post '/categories/update' do
    controller = CategoryController.new
    controller.update(params)

    redirect '/categories'
end