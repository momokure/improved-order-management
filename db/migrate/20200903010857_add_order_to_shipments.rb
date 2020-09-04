class AddOrderToShipments < ActiveRecord::Migration[5.2]
  def change
    add_reference :shipments, :order, index: true, foreign_key: true
  end
end
