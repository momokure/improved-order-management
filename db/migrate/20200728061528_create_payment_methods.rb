class CreatePaymentMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_methods do |t|
      t.string :payment_method_name
      t.string :payment_condition
      t.boolean :invoice_required, null: false, default: false
      t.timestamps
    end
  end
end
