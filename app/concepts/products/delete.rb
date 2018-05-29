# frozen_string_literal: true

module Products
  class Delete < ApplicationOperation
    def model!(params)
      Product.find(params[:id])
    end

    def process(*)
      model.update(deleted_at: Time.current)
    end
  end
end
