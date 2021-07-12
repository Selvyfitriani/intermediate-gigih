require 'sinatra'

get '/messages' do
    name = params["name"]
    color = params["color"] ? params["color"] : "DodgerBlue"
    erb :messages, locals: {
        name: name,
        color: color
    }
end 

get '/login' do
    erb :login
end

post '/login' do
    if params['username'] == 'admin' && params['password'] == 'admin'
        return 'Logged in!'
    else
        redirect '/login'
    end
end

get '/books' do
    book1 = params["book1"] ? params["book1"] : 'Your First Favourite Book'  
    book2 = params["book2"] ? params["book2"] : 'Your Second Favourite Book'  
    book3 = params["book3"] ? params["book3"] : 'Your Third Favourite Book'  
    erb :books, locals: {
        book1: book1,
        book2: book2,
        book3: book3,
    }
end

post '/add-book' do
    id = params["id"]
    title = params["title"]
    author = params["author"]


    erb :book, locals: {
        id: id,
        title: title,
        author: author
    }


end