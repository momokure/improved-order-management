class CreateTagPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_photos do |t|
      t.string :tag_photo
      t.references :customer_tag, index: true, foreign_key: true
      t.timestamps
    end
  end
end
