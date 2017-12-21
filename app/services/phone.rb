# frozen_string_literal: true

class Phone
  REGEX = /\A7[94]\d{9}\z/

  class << self
    def normalize(phone)
      phone.to_s.delete('^0-9').sub(/\A8/, '7')
    end
  end
end
