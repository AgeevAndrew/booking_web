module FMC
  class Response::Group < Response::Base
    def notification_key
      body['notification_key']
    end
  end
end
