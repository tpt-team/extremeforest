class Category < ActiveRecord::Base

  has_many :products
  has_many :subcategories

  validates :title, presence: true, uniqueness: true

end
