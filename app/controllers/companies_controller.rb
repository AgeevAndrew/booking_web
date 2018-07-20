# frozen_string_literal: true

class CompaniesController < BaseController
  def show; end

  private

  def store_facade
    Store::Facades::CompanyFacade
  end
end
