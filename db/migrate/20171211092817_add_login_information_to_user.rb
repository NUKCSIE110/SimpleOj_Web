class AddLoginInformationToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :last_login, :datetime
    add_column :users, :ip, :string
  end
end
