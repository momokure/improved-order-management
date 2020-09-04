class RemoveReferenceFromSortDetailsSecond < ActiveRecord::Migration[5.2]
  def change
    remove_reference :sort_details, :buy_type, index: true, foreign_key: true
    remove_reference :sort_details, :order, index: true, foreign_key: true
  end
end
