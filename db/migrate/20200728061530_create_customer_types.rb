class CreateCustomerTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_types do |t|
      t.string :customer_type_name
      t.timestamps
    end
  end
end
