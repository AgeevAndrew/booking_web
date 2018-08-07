# frozen_string_literal: true

module Tidings
  class Update < Create
    def model!(params)
      Tiding.find(params[:id])
    end
  end
end
