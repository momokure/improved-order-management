class CreateSpecifiedTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :specified_times do |t|
      t.string :specified_time_name
      t.timestamps
    end
  end
end
