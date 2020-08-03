class CreateTagSizesQuantities < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_sizes_quantities do |t|
      t.references :customer_tag, index: true, foreign_key: true
      t.references :tag_size, index: true, foreign_key: true
      t.integer :tag_quantity
      t.timestamps
    end
  end
end
