class AddUserToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :Questions, :user, :string
  end
end
