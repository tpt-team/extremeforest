class RemoveEmailAndUsernameFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :email, :string
    remove_column :orders, :username, :string
  end
end
