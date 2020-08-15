class CreateProgresses < ActiveRecord::Migration[5.2]
  def change
    create_table :progresses, options: "DEFAULT CHARSET=utf8mb4" do |t|
      t.string :progress_name
      t.timestamps
    end
  end
end
