class CreateOrderTechniqueDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_technique_details, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.references :order_detail, index: true, foreign_key: true
      t.references :technique, index: true, foreign_key: true
      t.references :progress, index: true, foreign_key: true
      t.references :representative_user, index: true, foreign_key: { to_table: :users }
      t.references :pasteup_user, index: true, foreign_key: { to_table: :users }
      t.references :maker, index: true, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
