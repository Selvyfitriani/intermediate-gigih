require 'sinatra'
require './db/db_connector'
require 'json'
require './models/item'

get '/items' do 
    items = Item.get_all_item_with_categories
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
    Item.create_new_item(name, price)

    redirect '/items'
end

get '/items/detail' do
    id = params["id"]
    item = Item.get_item_with_category(id)
    erb :detail, locals: {
        item: item,
        category: item.category
    }
end

get '/items/delete' do
    id = params["id"]
    Item.delete_item(id)
    
    redirect '/items'
end

get '/items/update' do
    id = params["id"]
    item = Item.get_item_with_category(id)
    categories = Item.get_all_categories()
    erb :update, locals: {
        item: item,
        categories: categories
    }
end

post '/items/update' do
    id = params["id"]
    name = params["name"]
    price = params["price"]
    category_id = params["category"]
    Item.update_item(id, name, price, category_id)

    redirect "/items/detail?id=#{id}"
end