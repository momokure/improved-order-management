class CreateBuyTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_types, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.string :buy_type_name
      t.timestamps
    end
  end
end
