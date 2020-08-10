class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :uid
      t.string :customer_name
      t.string :customer_furigana
      t.references :customer_type, index: true, foreign_key: true
      t.timestamps
    end
  end
end
