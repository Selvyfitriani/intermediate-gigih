require 'mysql2'

def create_db_client
    client = Mysql2::Client.new(
        :host => "localhost",
        :username => "root",
        :password => "passworD123!",
        :database => "food_oms_db"
    )

    client
end

def get_all_categories
    client = create_db_client()
    return client.query("SELECT * FROM categories")
end

def main()

    # print all categories
    categories = get_all_categories()
    categories.each do |category|
        puts(category)
    end

    
end

main()