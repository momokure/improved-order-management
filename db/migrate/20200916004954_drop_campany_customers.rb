class DropCampanyCustomers < ActiveRecord::Migration[5.2]
  def change
    drop_table :company_customers, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true
      t.timestamps
    end
  end
end
