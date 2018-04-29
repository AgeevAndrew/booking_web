module FMC
  class Response::Base

    attr_reader :code

    def self.parse(response)
      new(response)
    end

    def initialize(response)
      @code = response.code
      @body = JSON.parse(response.body)
    end

    private

    attr_reader :body

  end
end
