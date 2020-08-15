class CreateBuyNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_notes, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.text :buy_note
      t.references :buy_detail, index: true, foreign_key: true
      t.timestamps
    end
  end
end
