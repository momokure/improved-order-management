class CreateTagNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_notes do |t|
      t.text :tag_note
      t.references :customer_tag, index: true, foreign_key: true
      t.timestamps
    end
  end
end
