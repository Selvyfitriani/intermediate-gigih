require 'mysql2'
require './models/category'
require './models/item'

def create_db_client
    client = Mysql2::Client.new(
        :host => ENV["DB_HOST"],
        :username => ENV["DB_USER"],
        :password => ENV["DB_PASSWORD"],
        :database => ENV["DB_NAME"]
    )

    client
end