class CreateCompanyCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :company_customers do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true
      t.timestamps
    end
  end
end
