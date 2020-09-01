class CreateOverseasBuyingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :overseas_buying_details, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.boolean :sort
      t.boolean :transfer
      t.references :buying_user, index: true, foreign_key: { to_table: :users }
      t.references :buy_detail, index: true, foreign_key: true
      t.timestamps
    end
  end
end