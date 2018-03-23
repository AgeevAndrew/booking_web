module FMC
  class PushData < UseCase

    def initialize(registration_ids, data)
      @message = {
        registration_ids: Array(registration_ids),
        data: data
      }
    end

    def perform
      @result = Response::Push.parse(request)
    end

    private

    def uri
      URI('https://fcm.googleapis.com/fcm/send')
    end
  end
end
