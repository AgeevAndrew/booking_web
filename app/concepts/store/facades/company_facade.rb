# frozen_string_literal: true

module Store::Facades
  class CompanyFacade < BaseFacade
    def companies
      Company.where(id: @params[:id])
    end
  end
end
