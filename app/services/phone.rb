# frozen_string_literal: true

class Phone
  REGEX = /\A79\d{9}\z/

  class << self
    def normalize(phone)
      phone.to_s.delete('^0-9').sub(/\A89/, '79')
    end
  end
end
