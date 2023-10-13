class AddConfirmedDateTimesToSchedule < ActiveRecord::Migration[7.0]
  def change
    add_column :invites, :possible_confirmed_datetimes, :jsonb, default: {}
  end
end
