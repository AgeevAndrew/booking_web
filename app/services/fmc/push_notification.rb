module FMC
  class PushNotification < UseCase

    def initialize(registration_ids, title, body)
      @message = {
        registration_ids: Array(registration_ids),
        notification: {
          title: title,
          body: body
        }
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
