# frozen_string_literal: true

module Accounts
  class Show < ApplicationOperation
    representer AccountRepresenter

    def model!(params)
      Account.find_by(id: params[:id])
    end
  end
end
