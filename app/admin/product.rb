ActiveAdmin.register Product do

  permit_params :name, :description, :photo, :price

end
