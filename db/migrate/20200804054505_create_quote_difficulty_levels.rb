class CreateQuoteDifficultyLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :quote_difficulty_levels do |t|
      t.string :quote_difficulty_level_name
      t.integer :score
      t.timestamps
    end
  end
end
