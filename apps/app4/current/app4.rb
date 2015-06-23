
class App4 < Roda
  opts[:root] = File.expand_path(File.dirname(__FILE__) )
  opts[:add_script_name] = true
  
  plugin :render, :views => File.expand_path('../../../../views/app4', __FILE__)
  plugin :static, ["/images"], :root => File.expand_path('../../../public', __FILE__)
  plugin :assets, 
            css: 'app4.css', 
            # path: File.expand_path('../../../assets', __FILE__)
            path: File.expand_path('../../../../assets', __FILE__)
  
  route do |r|
    @app = "App4"
    r.assets
    
    r.root do
      @root = opts[:root]
      view :index
    end
  end
  
  require_relative "#{File.expand_path('../../../../helpers', __FILE__)}/app4-helpers"
  
end
