class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.string :company_name
      t.string :company_name_furigana
      t.timestamps
    end
  end
end
