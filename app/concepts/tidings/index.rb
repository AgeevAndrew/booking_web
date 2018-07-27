# frozen_string_literal: true

module Tidings
  class Index < ApplicationOperation
    representer Representers::TidingsRepresenter

    Facade = Struct.new(
                       :tidings,
    )

    def represented
      Facade.new(@model)
    end

    def model!(params)
      Tiding
        .where(copmany_id: params[:company_id])
        .order(created_at: :desc)
    end
  end
end
