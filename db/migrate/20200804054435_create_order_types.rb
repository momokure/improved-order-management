class CreateOrderTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :order_types, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.string :order_type_name
      t.timestamps
    end
  end
end
