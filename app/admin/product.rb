ActiveAdmin.register Product do

  permit_params :name, :description, :photo, :price, :category_id, :subcategory_id

  form :html => { :enctype => "multipart/form-data" } do |f|
   f.inputs "Details" do
    f.input :name
    f.input :description
    f.input :price
    f.input :category_id, :as => :select, :collection => Category.all.map {|u| [u.title.to_s, u.id]}
    f.input :subcategory_id, :as => :select, :collection => Subcategory.all.map {|u| [u.title.to_s, u.id]}
    f.input :photo, :as => :file, :hint => f.template.image_tag(f.object.photo.url(download: true))
  end
  f.actions
end

end
