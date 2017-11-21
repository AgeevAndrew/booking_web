# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  before_action :set_locale
  before_action :set_timezone

  respond_to :json

  private

  def set_locale
    header_locale = request.headers['User-Locale']
    locale = Language.locales.include?(header_locale) ? header_locale : I18n.default_locale
    I18n.locale = locale.to_sym
  end

  def set_timezone
    header_timezone = request.headers['User-TimeZone']
    timezone = LocalTimeZone.time_zones.include?(header_timezone) ? header_timezone : 'Vladivostok'
    Time.zone = ActiveSupport::TimeZone.new(timezone)
  end
end
