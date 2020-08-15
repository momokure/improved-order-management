class CreateInvoicingDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :invoicing_departments, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.references :payment_method, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true
      t.timestamps
    end
  end
end
