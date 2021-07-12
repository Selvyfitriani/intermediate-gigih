require 'sinatra'

get '/messages' do
    "<h1 style=\"background-color:DodgerBlue;\">Hello world</h1>"
end 

get '/messages/:name' do
    name = params['name']
    "<h1 style=\"background-color:DodgerBlue;\">Hello #{name}</h1>"
end