# frozen_string_literal: true

module Store::Facades
  class TidingsFacade < BaseFacade
    def tidings
      Tiding
          .where(company_id: current_user.company_id)
          .order(created_at: :desc)
    end
  end
end
