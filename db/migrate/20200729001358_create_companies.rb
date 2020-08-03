class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :company_name_furigana
      t.references :payment_method, index: true, foreign_key: true
      t.integer :receipt_required, null: false, default: 0
      t.timestamps
    end
  end
end
