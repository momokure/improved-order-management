class CreateDesiredDeliveryTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :desired_delivery_types, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.string :desired_delivery_type_name
      t.timestamps
    end
  end
end
