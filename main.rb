require 'sinatra'
require 'json'
require_relative './db/db_connector'
require_relative './models/item'
require_relative './controllers/item_controller'

get '/items' do 
    controller = ItemController.new
    controller.get_all
end

get '/items/detail/:id' do
    controller = ItemController.new
    controller.detail(params)
end

# ongoing

# belum

get '/items/create' do
    controller = ItemController.new
    controller.show_create_form
end

post '/items/create' do
    controller = ItemController.new
    controller.create_item(params)

    redirect '/items'
end


get '/items/delete/:id' do
    controller = ItemController.new
    controller.delete(params)
    
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