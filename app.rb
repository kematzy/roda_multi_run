require "./app1/current/app1"
require "./app2/current/app2"

class App < Roda
  plugin :multi_run
  plugin :render

  run "foo", App1
  run "bar", App2

  route do |r|
    @app = "Root"
    r.multi_run

    r.root do
      view :index
    end
  end
  freeze
end
