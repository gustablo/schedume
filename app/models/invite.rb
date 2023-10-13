class Invite < ApplicationRecord
  belongs_to :operator
  belongs_to :guest

  has_one :schedules

  def possible_confirmed_dates_to_a
    possible_confirmed_dates&.gsub(/\s+/, "")&.split(",")
  end

  def build_confirmed_datetimes(start_dates, end_dates)
    confirmed_datetimes = {}

    self.possible_confirmed_datetimes = possible_confirmed_dates_to_a.reduce({}) do |accumulator, date|
      start_hours = start_dates[date]
      end_hours = end_dates[date]

      if (start_hours.any?(&:blank?) || end_hours.any?(&:blank?))
        return yield
      end

      accumulator.merge!(date => {
                           start: start_hours,
                           end: end_hours,
                         })
    end
  end
end
