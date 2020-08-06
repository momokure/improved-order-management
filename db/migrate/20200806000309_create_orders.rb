class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :order_reflect_user, index: true, foreign_key: { to_table: :users }
      t.references :order_user, index: true, foreign_key: { to_table: :users }
      t.references :order_type, index: true, foreign_key: true
      t.references :quote_difficulty_level, index: true, foreign_key: true
      t.references :payment_method, index: true, foreign_key: true
      t.datetime :order_date
      t.datetime :first_response_date
      t.datetime :desired_delivery_date
      t.datetime :internal_delivery_date
      t.references :specified_time, index: true, foreign_key: true
      t.integer :domestic_buying
      t.integer :overseas_buying
      t.integer :carry_in
      t.datetime :payment_deadline
      t.integer :payment_amount
      t.integer :payment_confirmation
      t.integer :send_receipt
      t.integer :send_invoice
      t.integer :shipment_status
      t.datetime :shipment_date
      t.references :shipment_user, index: true, foreign_key: { to_table: :users }
      t.integer :cancellation
      t.timestamps
    end
  end
end