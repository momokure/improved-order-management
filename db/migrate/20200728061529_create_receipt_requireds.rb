class CreateReceiptRequireds < ActiveRecord::Migration[5.2]
  def change
    create_table :receipt_requireds do |t|
      t.string :receipt_required
      t.timestamps
    end
  end
end
