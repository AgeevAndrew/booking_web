# frozen_string_literal: true

class OrdersController < BaseController
  before_action :set_order, :set_order_token, only: %i[accept cancel]
  skip_before_action :authenticate_user!, except: [:index]

  def index
    present Orders::Filter
    redux_store('SharedReduxStore', props: @operation.to_json)
  end

  def accept
    if @order_token.present?
      @order.accept! && @order.save
      @order_token.destroy
      render :accept
    else
      render plain: 'Unauthorized', status: :unauthorized
    end
  end

  def cancel
    if @order_token.present?
      @order.cancel! && @order.save
      @order_token.destroy
      render :cancel
    else
      render plain: 'Unauthorized', status: :unauthorized
    end
  end

  private

  def set_order
    @order = Order.find params[:id]
  end

  def set_order_token
    @order_token = OrderToken.find_by(order_id: params[:id], token: params[:token])
  end
end
