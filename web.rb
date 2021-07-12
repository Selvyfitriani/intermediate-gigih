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
    books = ["Book 1", "Book 2", "Book 3"]
    erb :books, locals: {
        books: books
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