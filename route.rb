require 'sinatra'
require './db_connector'

get '/items' do 
    items = get_all_item_with_categories()
    erb :index, locals: {
        items: items
    }
end