require 'sinatra'
require './db_connector'

get '/items' do 
    items = get_all_item_with_categories()
    erb :index, locals: {
        items: items
    }
end

get '/items/create' do
    erb :create
end

post '/items/create' do
    name = params["name"]
    price = params["price"]
    create_new_item(name, price)

    redirect '/items'
end

get '/items/detail' do
    id = params["id"]
    item = get_item(id)
    erb :detail, locals: {
        item: item
    }
end