class CreateTechniques < ActiveRecord::Migration[5.2]
  def change
    create_table :techniques, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.string :technique_name
      t.timestamps
    end
  end
end
