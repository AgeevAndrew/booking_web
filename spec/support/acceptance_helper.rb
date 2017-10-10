# frozen_string_literal: true

module Acceptance
  module Helpers
    def json
      JSON.parse(response_body)
    end

    # def model_to_hash(model)
    #   model.values.except(:locale, :created_at).tap do |hash|
    #     hash[:updated_at] = hash[:updated_at].to_i
    #   end.stringify_keys
    # end

    # def headers(locale: 'en')
    #   {
    #     'Host' => 'api.ins.dev',
    #     'CONTENT_TYPE' => 'application/json',
    #     'Accept' => 'application/json',
    #     'User-Locale' => locale,
    #   }
    # end
    #
    # def auth_header(current_user)
    #   return if current_user.blank?
    #   key = current_user.class.to_s.foreign_key.to_sym
    #   "Bearer #{AccessToken.generate(key => current_user.id)}"
    # end
  end
end
