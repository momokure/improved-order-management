class CreateTagSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_sizes do |t|
      t.string :tag_size
      t.timestamps
    end
  end
end
