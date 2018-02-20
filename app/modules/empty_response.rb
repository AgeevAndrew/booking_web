# frozen_string_literal: true

module EmptyResponse
  def empty_response(*methods)
    methods.each do |method|
      define_method(method) { [] }
    end
  end
end
