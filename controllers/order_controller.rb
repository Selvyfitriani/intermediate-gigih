require "./models/order.rb"

class OrderController
    def create_order(params)
        order = Order.new({
            reference_no: params["ref_no"],
            customer_name: params["cust_name"],
            date: params["date"]
        })
        order.save
    end
    rendered = ERB.new(File.read("./views/order.erb"))
    rendered.result(binding)
end