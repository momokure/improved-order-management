class RemoveReferencesFromBuyDetail < ActiveRecord::Migration[5.2]
  def change
    remove_column :buy_details, :arrival_date, :specific
    remove_reference :buy_details, :buy_type, index: true, foreign_key: true
    remove_reference :buy_details, :supplier, index: true, foreign_key: true
    remove_reference :buy_details, :order_detail, index: true, foreign_key: true
  end
end
