# frozen_string_literal: true

Raven.configure do |config|
  config.dsn = 'https://6c7a1e0185e5440eaaa920e6f2058c3a:dc9fa12ba7e04a8292831d8dbe92d7b8@sentry.io/261854'
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
  config.environments = %w[staging production]
end
