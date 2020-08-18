class AddOrderToSortDetails < ActiveRecord::Migration[5.2]
  def change
    add_reference :sort_details, :order, foreign_key: true
  end
end
