class CreateCustomersCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :customers_companies do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true
      t.timestamps
    end
  end
end
