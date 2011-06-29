module Rack
  class ActiveRecordStatus
    def initialize(app, path='/app_status')
      @app, @path = app, path
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
        ActiveRecord::Base.connection.select_all('select 1')
        # Success
        [200, {'Content-Type' => 'text/plain'}, "OK #{Time.now}\n"]
      rescue
        body = ['ERROR', "#{$!.class}: #{$!.message}", "Backtrace:"] + $!.backtrace
        body *= "\n"
        [500, {'Content-Type' => 'text/plain'}, body]
      end
    end
  end
end
