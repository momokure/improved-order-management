class CreateCustomersTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :customers_types do |t|
      t.string :customers_types_name
      t.timestamps
    end
  end
end
