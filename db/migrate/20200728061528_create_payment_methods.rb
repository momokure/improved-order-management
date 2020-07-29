class CreatePaymentMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_methods do |t|
      t.string :payment_conditions
      t.string :invoice_required
      t.timestamps
    end
  end
end
