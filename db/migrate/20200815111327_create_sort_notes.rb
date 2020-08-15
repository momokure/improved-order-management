class CreateSortNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :sort_notes, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.text :sort_note
      t.references :sort_detail, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
