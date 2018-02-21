# frozen_string_literal: true

module Store::Facades
  class BaseFacade
    def initialize(params)
      @params = params
    end

    def current_users
      [current_user]
    end

    def companies
      return Company.all if current_user.company_id.nil?
      Company.where(id: current_user.company_id).all
    end

    extend ::EmptyResponse

    empty_response :categories, :addresses, :orders, :products, :order_products, :accounts

    private

    def current_user
      @params[:current_user]
    end

    def company_ids
      @company_ids ||= companies.map(&:id)
    end
  end
end
