class CreateOrderAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :order_addresses do |t|
      t.references :order, index: true, foreign_key: true
      t.references :customer_address, index: true, foreign_key: true
      t.timestamps
    end
  end
end
