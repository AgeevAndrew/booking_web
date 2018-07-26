# frozen_string_literal: true

module Store::Facades
  class CompanyFacade < BaseFacade
    def companies
      Company.where(id: @params[:id])
    end

    def company_schedules
      CompanySchedule.where(company_id: @params[:id]).order(:id)
    end

    def categories
      Category.where(id: companies.map(&:categories)).all
    end
  end
end
