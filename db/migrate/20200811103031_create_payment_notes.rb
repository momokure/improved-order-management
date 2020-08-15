class CreatePaymentNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_notes, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.text :payment_note
      t.references :payment, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
