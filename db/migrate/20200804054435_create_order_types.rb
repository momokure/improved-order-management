class CreateOrderTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :order_types do |t|
      t.string :order_type_name
      t.timestamps
    end
  end
end
