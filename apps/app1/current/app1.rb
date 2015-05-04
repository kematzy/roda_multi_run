class App1 < Roda
  opts[:root] = File.expand_path(File.dirname(__FILE__))
  opts[:add_script_name] = true
  
  plugin :render
  plugin :static, ["/images"]
  plugin :assets, css: 'app.css'

  route do |r|
    @app = "App1"
    r.assets

    r.root do
      @root = opts[:root]
      view :index
    end

    r.is "opts" do
      opts[:assets].inspect.gsub(",", "<br>")
    end

    r.is "img" do
      "<img src='images/bg.jpg'/>"
    end
  end
end
