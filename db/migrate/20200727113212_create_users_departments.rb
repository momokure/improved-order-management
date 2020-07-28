class CreateUsersDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :users_departments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true
      t.timestamps
    end
  end
end
