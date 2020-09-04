class CreateOrderTags < ActiveRecord::Migration[5.2]
  def change
    create_table :order_tags, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.boolean :custody_tag_status
      t.boolean :custody_request
      t.references :sewing_user, index: true, foreign_key: { to_table: :users }
      t.references :order_detail, index: true, foreign_key: true
      t.timestamps
    end
  end
end
