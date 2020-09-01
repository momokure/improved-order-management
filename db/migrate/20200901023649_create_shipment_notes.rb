class CreateShipmentNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :shipment_notes, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.text :shipment_note
      t.references :shipment, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
