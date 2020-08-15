class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.string :department_name, null: false
      t.timestamps
    end
  end
end
