
def _fep(path); File.expand_path(path, File.dirname(__FILE__));end

class App3 < Roda
  opts[:root] = _fep('app')
  opts[:add_script_name] = true
  
  plugin :render
  # plugin :static, ["/images"], :root => File.expand_path('./public', __FILE__)
  plugin :static, ["/images"], :root => _fep('app/public')
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
  
  def image(fname)
    uri(fname, true)
  end
  
  def uri(addr = nil, add_script_name = true)
    addr = addr.to_s if addr
    return addr if addr =~ /\A[A-z][A-z0-9\+\.\-]*:/
    uri = []
    # uri = if absolute
    #   h = if @env.has_key?(HTTP_X_FORWARDED_HOST) || port != (ssl? ? 443 : 80)
    #     host_with_port
    #   else
    #     host
    #   end
    #   ["http#{'s' if ssl?}://#{h}"]
    # else
    #   [EMPTY_STRING]
    # end
    uri << request.script_name.to_s if add_script_name
    uri << (addr || request.path_info)
    File.join(uri)
  end
  
  
end
