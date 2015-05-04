
def _fep(path); File.expand_path(path, File.dirname(__FILE__));end

class App3 < Roda
  opts[:root] = _fep('app')
  opts[:add_script_name] = true
  
  plugin :render
  plugin :static, ["/images"]
  plugin :assets, css: 'app.css', path: _fep('app/assets')
  
  route do |r|
    @app = "App3"
    r.assets
    
    r.root do
      @root = opts[:root]
      view :index
    end
  end
  
  require_relative 'app/helpers/app3-helpers'
  
end
