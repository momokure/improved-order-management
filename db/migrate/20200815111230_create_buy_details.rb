class CreateBuyDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_details, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.date :purchase_date
      t.date :arrival_date
      t.references :buy_progress, index: true, foreign_key: true
      t.references :buy_type, index: true, foreign_key: true
      t.references :supplier, index: true, foreign_key: true
      t.references :order_detail, index: true, foreign_key: true
      t.references :buying_user, index: true, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end