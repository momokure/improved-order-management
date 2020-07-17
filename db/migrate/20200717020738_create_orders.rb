class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :uuid
      t.string :name
      t.datetime :ordered_date
      t.datetime :responsed_date
      t.string :contact_person
      t.string :states
      t.string :silk_screen_a
      t.string :silk_screen_b
      t.string :silk_screen_c
      t.string :inkjet
      t.string :embroidery
      t.string :sewing
      t.string :uv
      t.string :silk_screen_d
      t.string :option_a
      t.string :option_b
      t.string :delivery_address
      t.datetime :desired_delivery_date
      t.datetime :internal_delivery_date
      t.datetime :payment_date
      t.integer :amount_paid
      t.string :location_name
      t.string :purchase_domestic_products
      t.string :purchase_oversea_products
      t.string :sorting
      t.string :order_note

      t.timestamps
    end
  end
end
