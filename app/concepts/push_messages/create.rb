# frozen_string_literal: true

class PushMessages::Create < ApplicationOperation
  representer PushMessageRepresenter

  contract Forms::CreateForm

  def model!(params)
    PushMessage.new(
      company_id: current_user.company_id,
      success: push_message.success,
      failure: push_message.failure
    )
  end

  def process(params)
    validate(params) do
      contract.save
    end
  end

  private

  def push_message
    @push_message ||= FMC::PushNotification.perform(registration_ids, @params[:title], @params[:body]).result
  end

  def registration_ids
    @registration_ids ||= Device.where(company_id: current_user.company_id).pluck(:registration_token)
  end
end
