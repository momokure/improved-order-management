class CreateOrderNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :order_notes do |t|
      t.text :order_note
      t.references :order, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
