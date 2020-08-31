class CreateShipments < ActiveRecord::Migration[5.2]
  def change
    create_table :shipments do |t|
      t.date :shipment_date
      t.references :factory, index: true, foreign_key: true
      t.references :shipment_user_id, index: true, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end