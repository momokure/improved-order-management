class CreateSortDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :sort_details, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.date :sort_date
      t.references :buy_type, index: true, foreign_key: true
      t.references :order_detail, index: true, foreign_key: true
      t.references :sorting_user, index: true, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end