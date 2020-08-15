class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.string :position_name, null: false
      t.timestamps
    end
  end
end
