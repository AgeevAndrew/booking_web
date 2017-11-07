# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    respond Orders::Create, location: nil
  end
end
