class Application

    @@items = []

    def call(env)
      req = Rack::Request.new(env)
      resp = Rack::Response.new
  
      if req.path.match(/items/)
        search_name = req.path.split("/")[-1] # '-1' == last array element
        found_item = @@items.find { |fi| fi.name == search_name }
        if found_item
          resp.write(found_item.price)
        else
          resp.write("Item not found")
          resp.status = 400
        end
      else
        resp.write "Route not found"
        resp.status = 404
      end
  
      resp.finish
    end

end
  