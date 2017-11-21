# frozen_string_literal: true

module LocalTimeZone
  module_function

  TIMEZONES = {
    'UTC' => '+ 00:00',
    'Moscow' => '+ 03:00',
    'Vladivostok' => '+ 10:00',
  }.freeze

  def all
    TIMEZONES
  end

  def time_zones
    TIMEZONES.keys
  end
end
