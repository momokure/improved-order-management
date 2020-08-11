class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.date :payment_date
      t.integer :amount_paid
      t.references :accounting_user, index: true, foreign_key: { to_table: :users }
      t.references :order, index: true, foreign_key: true
      t.timestamps
    end
  end
end