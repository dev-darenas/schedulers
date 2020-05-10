class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.references :schedule, null: false, foreign_key: true
      t.datetime :reservation_date, null: false, unique: true

      t.timestamps
    end
  end
end
