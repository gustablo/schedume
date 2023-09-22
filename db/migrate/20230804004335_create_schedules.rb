class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :link
      t.string :provider
      t.datetime :date
      t.references :operator, null: false, foreign_key: true
      t.references :guest, null: false, foreign_key: true
      t.references :invite, null: false, foreign_key: true

      t.timestamps
    end
  end
end
