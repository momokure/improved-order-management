class CreateCustomerEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_emails, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.string :customer_email
      t.references :customer, index: true, foreign_key: true
      t.timestamps
    end
  end
end
