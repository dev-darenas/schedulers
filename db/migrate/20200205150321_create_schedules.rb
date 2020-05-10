class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.date :starts_at
      t.date :ends_at

      t.timestamps
    end
  end
end
