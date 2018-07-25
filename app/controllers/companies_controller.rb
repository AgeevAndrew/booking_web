# frozen_string_literal: true

class CompaniesController < BaseController
  before_action :authenticate_user!, only: [:delivery_time_change]
  respond_to :json
  def show; end

  def delivery_time_change
    respond Companies::DeliveryTimeChange, location: nil
  end
  private

  def store_facade
    Store::Facades::CompanyFacade
  end
end
