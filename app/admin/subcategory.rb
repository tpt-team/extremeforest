ActiveAdmin.register Subcategory do

permit_params :title, :category_id

form :html => { :enctype => "multipart/form-data" } do |f|
 f.inputs "Details" do
  f.input :title
  f.input :category_id, :as => :select, :collection => Category.all.map {|u| [u.title.to_s, u.id]}
end
f.actions
end

end
