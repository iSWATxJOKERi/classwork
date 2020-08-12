class CreateUpdateUser < ActiveRecord::Migration[5.2]
  def change
      remove_column :users, :name, :username
      remove_column :users, :email
  end
end
