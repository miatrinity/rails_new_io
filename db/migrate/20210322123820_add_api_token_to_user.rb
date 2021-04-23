class AddApiTokenToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :api_token, :string
  end
end
