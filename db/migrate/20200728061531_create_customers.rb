class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.string :uid, null: false
      t.string :customer_name
      t.string :customer_furigana
      t.references :customer_type, index: true, foreign_key: true
      t.timestamps
    end
    add_index :customers, :uid, unique: true
  end
end
