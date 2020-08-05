class CreateBuyTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_types do |t|
      t.string :buy_type_name
      t.timestamps
    end
  end
end
