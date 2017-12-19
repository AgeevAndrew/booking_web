# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, :set_order_token
  skip_before_action :authenticate_user!

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
