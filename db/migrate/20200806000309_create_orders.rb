class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :uid
      t.references :customer, index: true, foreign_key: true
      t.references :order_reflect_user, index: true, foreign_key: { to_table: :users }
      t.references :csr_user, index: true, foreign_key: { to_table: :users }
      t.references :order_type, index: true, foreign_key: true
      t.references :quote_difficulty_level, index: true, foreign_key: true
      t.references :payment_method, index: true, foreign_key: true
      t.datetime :order_date
      t.datetime :first_response_date
      t.datetime :desired_delivery_date
      t.references :desired_delivery_type, index: true, foreign_key: true
      t.datetime :internal_delivery_date
      t.references :specified_time, index: true, foreign_key: true
      t.boolean :domestic_buying, null: false, default: true
      t.boolean :overseas_buying, null: false, default: false
      t.boolean :carry_in, null: false, default: false
      t.datetime :payment_deadline_date
      t.integer :payment_amount
      t.boolean :payment_confirmation, null: false, default: false
      t.boolean :send_receipt, null: false, default: false
      t.boolean :send_invoice, null: false, default: false
      t.boolean :shipment_status, null: false, default: false
      t.datetime :shipment_date
      t.references :shipment_user, index: true, foreign_key: { to_table: :users }
      t.integer :cancellation
      t.timestamps
    end
  end
end