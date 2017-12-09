class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.integer :qid
      t.text :code
      t.integer :type
      t.boolean :judged
      t.string :uuid
      t.string :result
      t.string :user

      t.timestamps
    end
  end
end
