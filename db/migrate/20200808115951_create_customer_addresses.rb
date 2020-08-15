class CreateCustomerAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_addresses, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.bigint :prefecture_code, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.timestamps
    end
  end
end
