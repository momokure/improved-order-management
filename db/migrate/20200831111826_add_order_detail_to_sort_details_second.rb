class AddOrderDetailToSortDetailsSecond < ActiveRecord::Migration[5.2]
  def change
    add_reference :sort_details, :order_detail, foreign_key: true
  end
end
