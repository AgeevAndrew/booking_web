# frozen_string_literal: true

module Accounts
  class Update < Create
    def model!(params)
      Account.find(params[:id])
    end
  end
end
