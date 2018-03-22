module FMC
  class CreateGroup < UseCase
    def initialize(group_name, registration_ids = [])
      @message = {
        operation: 'create',
        notification_key_name: group_name,
        registration_ids: registration_ids
      }
    end

    def perform
      @result = Response::Group.parse(request)
    end

    private

    def headers
      super.merge( 'project_id' => ENV['firebase_cloud_messaging_sender_id'] )
    end

    def uri
      URI('https://android.googleapis.com/gcm/notification')
    end
  end
end
