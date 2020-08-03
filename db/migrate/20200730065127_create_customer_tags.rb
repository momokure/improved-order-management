class CreateCustomerTags < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_tags do |t|
      t.string :tag_name
      t.string :tag_type
      t.string :tag_position
      t.integer :brand_name_tag_cut
      t.integer :composition_tag_cut
      t.references :tag_sewing_method, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.timestamps
    end
  end
end
