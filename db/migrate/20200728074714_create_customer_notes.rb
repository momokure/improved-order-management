class CreateCustomerNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_notes do |t|
      t.text :customer_note
      t.references :customer, index: true, foreign_key: true
      t.timestamps
    end
  end
end
