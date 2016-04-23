class RemovePhotoFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :photo, :string
  end
end
