# frozen_string_literal: true

class TidingsController < BaseController
  before_action :set_tiding, only: [:update, :destroy, :activate, :deactivate]
  before_action :store_facade, only: [:index]

  respond_to :json

  def index; end

  def create
    respond Tidings::Create, location: nil
  end

  def update
    if  @tiding
      respond Tidings::Update, location: nil
    else
      head :not_found
    end
  end

  def destroy
    if @tiding
      @tiding.destroy
      head :no_content
    else
      head :not_found
    end
  end

  def activate
    respond Tidings::Activate, location: nil
  end

  def deactivate
    respond Tidings::Deactivate, location: nil
  end

  private

  def store_facade
    Store::Facades::TidingsFacade
  end

  def tiding_params
    params.require(:tiding).permit(:category, :company_id, :title, :body, :message, :active)
  end

  def set_tiding
    @tiding = Tiding.find_by(id: params[:id])
  end
end
