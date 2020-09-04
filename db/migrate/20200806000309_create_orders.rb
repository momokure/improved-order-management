class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.string :uid, null: false
      t.references :customer, index: true, foreign_key: true
      t.references :order_reflect_user, index: true, foreign_key: { to_table: :users }
      t.references :representative_user, index: true, foreign_key: { to_table: :users }
      t.references :order_type, index: true, foreign_key: true
      t.references :quote_difficulty_level, index: true, foreign_key: true
      t.references :payment_method, index: true, foreign_key: true
      t.datetime :order_date
      t.datetime :first_response_date
      t.date :desired_delivery_date
      t.references :desired_delivery_type, index: true, foreign_key: true
      t.date :internal_delivery_date
      t.boolean :change_delivery_date, null: false, default: false
      t.references :specified_time, index: true, foreign_key: true
      t.boolean :domestic_buying, null: false, default: true
      t.boolean :overseas_buying, null: false, default: false
      t.boolean :carry_in, null: false, default: false
      t.date :payment_deadline_date
      t.integer :payment_amount
      t.boolean :payment_confirmation, null: false, default: false
      t.boolean :send_receipt, null: false, default: false
      t.boolean :send_invoice, null: false, default: false
      t.datetime :shipment_date
      t.references :shipment_user, index: true, foreign_key: { to_table: :users }
      t.integer :cancellation, null: false, default: false
      t.timestamps
    end
    add_index :orders, :uid, unique: true
  end
end