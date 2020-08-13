class CreateOrderDetailOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :order_detail_options do |t|
      t.references :order_detail, index: true, foreign_key: true
      t.references :order_option, index: true, foreign_key: true
      t.timestamps
    end
  end
end