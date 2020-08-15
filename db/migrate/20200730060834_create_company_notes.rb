class CreateCompanyNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :company_notes, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.text :company_note
      t.references :company, index: true, foreign_key: true
      t.timestamps
    end
  end
end
