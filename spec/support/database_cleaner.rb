
# frozen_string_literal: true

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  KEEP_TABLES = %w[spatial_ref_sys].freeze

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation, except: KEEP_TABLES)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
