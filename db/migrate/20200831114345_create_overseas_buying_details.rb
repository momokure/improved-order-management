class CreateOverseasBuyingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :overseas_buying_details do |t|
      t.date :sort_date
      t.date :transfer_date
      t.references :buy_details, index: true, foreign_key: true
      t.timestamps
    end
  end
end