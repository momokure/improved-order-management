class CreateTagSewingMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_sewing_methods do |t|
      t.string :tag_sewing_method_name
      t.timestamps
    end
  end
end
