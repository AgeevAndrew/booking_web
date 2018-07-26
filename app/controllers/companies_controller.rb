# frozen_string_literal: true

class CompaniesController < BaseController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:delivery_time_change]
  respond_to :json
  def show
    if @company.present?
      render :show
    else
      render json: {}, status: :not_found
    end
  end

  def delivery_time_change
    respond Companies::DeliveryTimeChange, location: nil
  end
  private

  def store_facade
    Store::Facades::CompanyFacade
  end

  def set_company
    @company = Company.find_by(id: params[:id])
  end
end
