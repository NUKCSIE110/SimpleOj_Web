class MoveProblemsContentToFile < ActiveRecord::Migration[5.1]
  def change
    remove_column :problems, :text
  end
end
