# frozen_string_literal: true

module Companies::Forms
  class DeliveryTimeChangeForm < Reform::Form
    property :week_day
    property :time_start
    property :time_end

    validates :week_day, :time_start, :time_end, presence: true
    validates :week_day, inclusion: { in: %w[mon tue wed thu fri sat sun] }
  end
end
