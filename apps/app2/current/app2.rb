class App2 < Roda
  opts[:root] = File.expand_path('sub', File.dirname(__FILE__))
  opts[:add_script_name] = true
  
  plugin :render
  # plugin :static, [File.expand_path('/images', File.dirname(__FILE__))]
  # plugin :static, ['/images']
  plugin :assets, css: 'app.scss', path: File.expand_path('assets', File.dirname(__FILE__)), css_route: 'css'

  route do |r|
    @app = "App2"
    r.assets

    r.root do
      @root = opts[:root]
      view :index
    end
  end
end
