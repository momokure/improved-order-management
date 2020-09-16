class AddCompanyToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_reference :customers, :company, index: true, foreign_key: true, default: 1
    add_column :customers, :sales, :boolean, default: 0
  end
end
