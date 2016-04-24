class Product < ActiveRecord::Base

  belongs_to :category

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  scope :by_category, -> (id) { joins(:category).where('categories.id = ?', id) if id }
  scope :psearch, -> (name) { where('name ILIKE :q OR description ILIKE :q', q: "%#{name}%") if name }
  scope :scopedproduct, -> (params) { psearch(params[:search]).by_category(params[:id]).page(params[:page]).per(8) }

end
