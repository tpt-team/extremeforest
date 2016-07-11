class AddCityToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :nova_poshta, :integer
    add_column :orders, :city, :string
  end
end
