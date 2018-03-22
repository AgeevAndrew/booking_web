module FMC
  class ManageGroup < UseCase

    def initialize(operation, group_name, group_key, registration_ids)
      raise ArgumentError, 'Operation should be add or remove' unless ['add', 'remove'].include?(operation)
      @message = {
        operation: operation,
        notification_key_name: group_name,
        notification_key: group_key,
        registration_ids: Array(registration_ids)
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
