# frozen_string_literal: true

class TidingsController < BaseController
  before_action :store_facade, only: [:index]

  def index; end

  def create
      respond Tidings::Create, location: nil
  end

  def update
    respond_to do |format|
      if @tiding.update(tiding_params)
        format.json { render json: {}, status: :ok, location: @tiding }
      else
        format.json { render json: @tiding.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tiding.destroy
    respond_to do |format|
      format.json { render json: {}, status: :ok }
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
    params.require(:tiding).permit(:category, :title, :body, :message, :active)
  end

  def set_tiding
    @tiding = Tiding.find_by(id: params[:id])
  end
end
