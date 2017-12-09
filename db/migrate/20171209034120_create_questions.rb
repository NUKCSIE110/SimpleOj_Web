class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :qid
      t.text :text
      t.boolean :asked
      t.text :response

      t.timestamps
    end
  end
end
