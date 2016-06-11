class Product < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  is_impressionable
  belongs_to :category
  belongs_to :subcategory

  has_many :comments, dependent: :destroy

  scope :by_category, -> (id, subid) do
    if id
      joins(:category).where('categories.id = ?', id)
    elsif subid
      joins(:subcategory).where('subcategories.id = ?', subid)
    end
  end
  scope :psearch, -> (name) { where('name ILIKE :q OR description ILIKE :q', q: "%#{name}%") if name }
  scope :scopedproduct, -> (params) { psearch(params[:search]).by_category(params[:id], params[:subid]).page(params[:page]).per(8) }
  scope :in_cart, -> (cart) { where(id: cart) }
end
