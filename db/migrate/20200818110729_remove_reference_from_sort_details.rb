class RemoveReferenceFromSortDetails < ActiveRecord::Migration[5.2]
  def change
    remove_reference :sort_details, :order_detail, index: true, foreign_key: true
  end
end
