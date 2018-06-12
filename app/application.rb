require 'pry'

class Application
  @@items = [Item.new(name: "Figs", price: 3.42),Item.new(name: "Pears", price: 0.99)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      item = req.path.split("/items/").last #turn /songs/Sorry into Sorry
       if item == @@items.find{|i| i.name == item

        resp.write song.artist
        binding.pry
         if @@items.include?(this_item)
           resp.write "This #{this_item} costs #{this_item}"
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
