class CreateCustomerTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_types, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.string :customer_type_name
      t.timestamps
    end
  end
end
