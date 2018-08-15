# frozen_string_literal: true

class Api::TidingsController < ApplicationController
  respond_to :json
  def index
    respond Tidings::Index, location: nil
  end

  def show
    respond Tidings::Show, location: nil
  end
end
