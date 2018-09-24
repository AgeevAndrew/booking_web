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
        .where(company_id: params[:company_id])
        .order(id: :desc)
    end
  end
end
