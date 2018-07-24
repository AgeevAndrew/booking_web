# frozen_string_literal: true

class CompaniesController < BaseController
  respond_to :html, :xml, :json
  before_action :authenticate_user!, only: [:show, :delivery_time_change]
  def show; end

  def delivery_time_change
    respond Companies::DeliveryTimeChange, location: nil
  end
  private

  def store_facade
    Store::Facades::CompanyFacade
  end
end
