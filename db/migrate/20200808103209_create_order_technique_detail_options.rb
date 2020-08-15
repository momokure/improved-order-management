class CreateOrderTechniqueDetailOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :order_technique_detail_options, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.references :order_detail, index: true, foreign_key: true
      t.references :technique_option, index: true, foreign_key: true
      t.timestamps
    end
  end
end
