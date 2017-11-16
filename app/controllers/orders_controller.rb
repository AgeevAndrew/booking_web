# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    respond Orders::Index, location: nil
  end

  def create
    respond Orders::Create, location: nil
  end

  def accept
    respond Orders::Accept, location: nil
  end

  def cancel
    respond Orders::Cancel, location: nil
  end
end
