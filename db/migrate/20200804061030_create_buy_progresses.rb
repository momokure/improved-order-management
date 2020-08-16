class CreateBuyProgresses < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_progresses do |t|
      t.string :buy_progress_name
      t.timestamps
    end
  end
end
