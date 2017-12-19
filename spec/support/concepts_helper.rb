
# frozen_string_literal: true

module Concepts
  module Helpers
    def json
      JSON.parse(operation.to_json)
    end
  end
end
