class CreateSpecifiedTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :specified_times, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.string :specified_time_name
      t.timestamps
    end
  end
end
