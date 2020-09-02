class RemoveReferencesFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :shipment_date, :specific
    remove_reference :orders, :shipment_user, index: true, foreign_key: { to_table: :users }
    change_column :orders, :cancellation, :boolean
  end
end