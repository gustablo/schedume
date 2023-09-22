class AddPossibleConfirmedDatesV2 < ActiveRecord::Migration[7.0]
  def change
    add_column :invites, :possible_confirmed_dates, :string
  end
end
