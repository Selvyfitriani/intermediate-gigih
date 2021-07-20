require 'mysql2'
require './category'
require './item'

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
    get_categories_query = "SELECT * FROM categories"
    rawData = client.query(get_categories_query)

    categories = Array.new
    rawData.each do |datum|
        category = Category.new(datum["id"], datum["name"])
        categories.push(category)
    end
    
    categories
end

def get_all_item_with_categories
    client = create_db_client()
    get_items_query =   "SELECT items.*, categories.id AS 'category_id', categories.name AS 'category_name'
                        FROM items
                        LEFT JOIN item_categories ON items.id = item_categories.item_id
                        LEFT JOIN categories ON item_categories.category_id = categories.id
                        "
    rawData = client.query(get_items_query)

    items = Array.new
    rawData.each do |datum|
        category = Category.new(datum["category_id"], datum["category_name"])
        item = Item.new(datum["id"], datum["name"], datum["price"], category)
        items.push(item)
    end

    items 
end

def get_items_cheaper_than(price)
    client = create_db_client()
    get_items_cheaper_query = "SELECT * FROM items
                              where price < #{price}"
    return client.query(get_items_cheaper_query)
end

def main()

    # print all categories
    puts("=================Categories======================")
    categories = get_all_categories()
    categories.each do |category|
        puts(category)
    end
    puts("\n")

    # print all items with their categories
    puts("==============Items with Categories==============")
    items = get_all_item_with_categories()
    items.each do |item|
        puts(item)
    end
    puts("\n")

    # print all items that cheaper than a price
    price = 20000 # insert your price here
    puts("===========Items Cheaper Than #{price}============")
    items_cheaper = get_items_cheaper_than(price)
    items_cheaper.each do |item|
        puts(item)
    end
    puts("\n")
    
end

main()