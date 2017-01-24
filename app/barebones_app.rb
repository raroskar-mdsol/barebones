module Barebones
  class App

    def self.instance
      @instance ||= Rack::Builder.new do
        run Barebones::App.new
      end.to_app
    end

    def call(env)
      # api
      response = Barebones::API.call(env)

      # Serve error pages or respond with API response
      case response[0]
        when 404, 500
          content = @rack_static.call(env.merge('PATH_INFO' => "/errors/#{response[0]}.html"))
          [response[0], content[1], content[2]]
        else
          response
      end
    end
  end
end