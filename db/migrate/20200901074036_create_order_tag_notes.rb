class CreateOrderTagNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :order_tag_notes, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.text :order_tag_note
      t.references :order_tag, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
