# frozen_string_literal: true

module Companies
  class DeliveryTimeChange < ApplicationOperation
    contract Forms::DeliveryTimeChangeForm

    def model!(params)
      CompanySchedule.find_or_initialize_by(company_id: params[:id], week_day: params[:week_day])
    end

    def process(params)
      validate(params) do
        model.update(
          time_start: contract.time_start,
          time_end: contract.time_end,
        )
      end
    end
  end
end
