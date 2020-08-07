class CreateIndividualCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :individual_customers do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :payment_method, index: true, foreign_key: true
      t.boolean :receipt_required, null: false, default: false
      t.timestamps
    end
  end
end
