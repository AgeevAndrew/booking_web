module FMC
  class Response::Push < Response::Base
    def multicast_id
      body['multicast_id']
    end

    def success
      body['success']
    end

    def failure
      body['failure']
    end

    def canonical_ids
      body['canonical_ids']
    end

    def results
      body['results']
    end
  end
end
