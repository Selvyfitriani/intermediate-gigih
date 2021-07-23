require 'sinatra'
require './controllers/order_controller.rb'

get '/order' do
    controllers = OrderController.new
    controllers.find_order(params)
end

post ''