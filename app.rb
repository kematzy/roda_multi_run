%w(app1 app2 app3).each { |a| require "./apps/#{a}/current/#{a}" }

class App < Roda
  opts[:root] = File.expand_path(File.dirname(__FILE__))
  opts[:add_script_name] = true
  
  # make global images available
  plugin :static, ['/images']
  
  plugin :multi_run
  plugin :render
  

  run "app1", App1
  run "app2", App2
  run "app3", App3

  route do |r|
    @app = "Root"
    r.multi_run

    r.root do
      view :index
    end
    
    r.is 'blog' do
      r.get do
        view :blog
        # "Welcome to my non-existent blog!"
      end
    end
    
  end
  freeze
end
