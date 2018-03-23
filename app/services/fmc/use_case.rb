module FMC
  class UseCase

    attr_reader :result

    def self.perform(*args)
      new(*args).tap { |use_case| use_case.perform }
    end

    def perform
      raise NotImplementedError
    end

    def success?
      result.code == '200'
    end

    private

    def headers
      {
        'Content-Type' => 'application/json',
        'Authorization' => ENV['firebase_cloud_messaging_key']
      }
    end

    def request
      Net::HTTP.post(uri, @message.to_json, headers)
    end
  end
end
