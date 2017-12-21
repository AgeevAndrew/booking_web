# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ReactOnRails::Controller

  protect_from_forgery with: :exception
  before_action :authenticate_user!, unless: proc { |c| c.controller_path.start_with?('api') }
  skip_before_action :verify_authenticity_token
  before_action :set_locale
  before_action :set_timezone
  before_action :set_raven_context

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

  def set_raven_context
    Raven.user_context(opeartor: current_user&.id) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
