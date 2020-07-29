class CreateCustomerPhoneNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_phone_numbers do |t|
      t.text :customer_phone_number
      t.references :customer, index: true, foreign_key: true
      t.timestamps
    end
  end
end
