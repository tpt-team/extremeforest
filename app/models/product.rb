class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  is_impressionable

  belongs_to :category
  belongs_to :subcategory

  has_many :comments, dependent: :destroy

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  scope :by_category, -> (id, subid) do
    if id
      joins(:category).where('categories.id = ?', id)
    elsif subid
      joins(:subcategory).where('subcategories.id = ?', subid)
    end
    #joins(:subcategory).where('subcategories.id = ?', subid) if subid
  end
  scope :psearch, -> (name) { where('name ILIKE :q OR description ILIKE :q', q: "%#{name}%") if name }
  scope :scopedproduct, -> (params) { psearch(params[:search]).by_category(params[:id], params[:subid]).page(params[:page]).per(8) }
  scope :in_cart, -> (cart) { where(id: cart) }

  def normalize_friendly_id(text)
    text.to_slug.normalize(transliterations: :russian).to_s
  end
end
