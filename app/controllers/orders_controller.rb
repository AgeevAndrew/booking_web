# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    respond Orders::Index, location: nil
  end

  def create
    respond Orders::Create, location: nil
  end
end
