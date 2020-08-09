class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.boolean :mixed_techniques, null: false, default: false
      t.boolean :large_order, null: false, default: false
      t.references :factory, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.timestamps
    end
  end
end