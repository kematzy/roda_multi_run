class App2 < Roda
  opts[:root] = "sub"
  plugin :render
  plugin :static, ["/images"]
  plugin :assets, css: 'app.css'

  route do |r|
    @app = "App2"
    r.assets

    r.root do
      @root = opts[:root]
      view :index
    end
  end
end
