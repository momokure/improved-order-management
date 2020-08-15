class CreateFactories < ActiveRecord::Migration[5.2]
  def change
    create_table :factories, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.string :factory_name, null: false
      t.timestamps
    end
  end
end
