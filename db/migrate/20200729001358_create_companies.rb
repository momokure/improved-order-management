class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.text :company_name
      t.text :company_name_furigana
      t.integer :payment_method
      t.integer :invoice_required
      t.integer :receipt_required
      t.timestamps
    end
  end
end
