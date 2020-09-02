class DropSuppliers < ActiveRecord::Migration[5.2]
  def change
    drop_table :suppliers, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.string :supplier_name
      t.timestamps
    end
  end
end
