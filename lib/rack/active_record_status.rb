module Rack
  class ActiveRecordStatus
    def initialize(app)
      @app = app
    end

    def call(env)
      if env['PATH_INFO'] == '/active_record_status'
        get_status
      else
        @app.call(env)
      end
    end

    def get_status
      begin
        ActiveRecord::Base.connection.select_all('select 1')
        body = "OK #{Time.now}"
        [200, {'Content-Type' => 'text/plain'}, body]
      rescue
        body = ['ERROR', "#{$!.class}: #{$!.message}", "Backtrace:"] + $!.backtrace
        body *= "\n"
        [500, {'Content-Type' => 'text/plain'}, body]
      end
    end
  end
end
