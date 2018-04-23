# frozen_string_literal: true

module Store::Facades
  class PushMessagesFacade < BaseFacade
    def push_messages
      PushMessage.where(company_id: companies.map(&:id)).all
    end
  end
end
