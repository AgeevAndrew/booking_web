# frozen_string_literal: true

module Store
  class Operation < ApplicationOperation
    representer Representer

    def represented
      @params[:store_facade].new(@params)
    end
  end
end
