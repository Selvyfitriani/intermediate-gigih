require 'sinatra'
require './db/db_connector'
require 'json'
require './models/item'

get '/items' do 
    items = Item.get_with_categories
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
    Item.create(name, price)

    redirect '/items'
end

get '/items/detail' do
    id = params["id"]
    item = Item.get_with_category(id)
    erb :detail, locals: {
        item: item,
        category: item.category
    }
end

get '/items/delete' do
    id = params["id"]
    Item.delete(id)
    
    redirect '/items'
end

get '/items/update' do
    id = params["id"]
    item = Item.get_with_category(id)
    categories = Category.get_all()
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
    Item.update(id, name, price, category_id)

    redirect "/items/detail?id=#{id}"
end