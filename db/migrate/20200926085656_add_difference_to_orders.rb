class AddDifferenceToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :difference, :integer
  end
end
