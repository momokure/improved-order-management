class AddOrderToBuyDetails < ActiveRecord::Migration[5.2]
  def change
    add_reference :buy_details, :order, index: true, foreign_key: true
  end
end
