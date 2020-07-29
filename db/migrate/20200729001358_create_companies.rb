class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.text :company_name
      t.text :company_name_furigana
      t.references :payment_method, index: true, foreign_key: true
      t.references :receipt_required, index: true, foreign_key: true
      t.timestamps
    end
  end
end
