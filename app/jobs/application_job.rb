# frozen_string_literal: true

class ApplicationJob < ActiveJob::Base
  private

  attr_reader :order

  def operators
    return order.company.contact_info['email'] if Rails.env.production?
    ['ageevaa@arink-group.ru', 'mokovvy@arink-group.ru']
  end
end
