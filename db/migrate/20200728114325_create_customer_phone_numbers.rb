class CreateCustomerPhoneNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_phone_numbers do |t|
      t.string :customer_phone_number
      t.references :customer, index: true, foreign_key: true
      t.timestamps
    end
  end
end
