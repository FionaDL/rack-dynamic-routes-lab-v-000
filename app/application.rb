require 'pry'

class Application
  @@items = [Item.new(name: "Figs", price: 3.42),Item.new(name: "Pears", price: 0.99)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      item = req.path.split("/items/").last 
       if item == @@items.find{|i| i.name == item}
         item.price
        binding.pry
       else
         resp.write "Couldn't find item"
         resp.status = 400
       end
    else
       resp.write "Route not found"
       resp.status = 404
    end
    resp.finish
  end
end
