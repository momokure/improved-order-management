class CreateTechniques < ActiveRecord::Migration[5.2]
  def change
    create_table :techniques do |t|
      t.string :technique_name
      t.timestamps
    end
  end
end
