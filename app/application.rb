require 'pry'

class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
        this_item = req.path.split("/items/").last
        binding.pry
         if @@items.include?(this_item)
           resp.write "This #{this_item.name} costs #{new_item.price}"
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
