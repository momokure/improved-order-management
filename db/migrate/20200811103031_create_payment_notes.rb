class CreatePaymentNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_notes do |t|
      t.text :payment_note
      t.references :payment, index: true, foreign_key: true
      t.timestamps
    end
  end
end
