require 'sinatra'
require './db_connector'
require 'json'

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
    item = get_item_with_category(id)
    erb :detail, locals: {
        item: item,
        category: item.category
    }
end

get '/items/delete' do
    id = params["id"]
    delete_item(id)
    
    redirect '/items'
end

get '/items/update' do
    id = params["id"]
    item = get_item_with_category(id)
    categories = get_all_categories()
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
    update_item(id, name, price, category_id)

    redirect "/items/detail?id=#{id}"
end