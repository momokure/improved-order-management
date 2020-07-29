class CreateCustomerEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_emails do |t|
      t.text :customer_email
      t.references :customer, index: true, foreign_key: true
      t.timestamps
    end
  end
end
