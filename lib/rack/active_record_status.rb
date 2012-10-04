module Rack
  class ActiveRecordStatus
    def initialize(app, options={})
      @app = app
      # Support legacy arguments (0.4.1 and below)
      options = {:path => options} if options.is_a?(String)

      @path = options[:path] || '/app_status'
      @response = options[:response] || "OK\n"
    end

    def call(env)
      if @path == env['PATH_INFO']
        get_status
      else
        @app.call(env)
      end
    end

    def get_status
      begin
        # Check that the application is connected to the database
        ActiveRecord::Base.connection.select_all('select "app_status"')
        # Success
        [200, {'Content-Type' => 'text/plain'}, [@response]]
      rescue
        body = ['ERROR', "#{$!.class}: #{$!.message}", "Backtrace:"] + $!.backtrace
        body *= "\n"
        [500, {'Content-Type' => 'text/plain'}, [body]]
      end
    end
  end
end
