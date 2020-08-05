class CreateOrderOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :order_options do |t|
      t.string :order_option_name
      t.timestamps
    end
  end
end
