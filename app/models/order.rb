class Order < ActiveRecord::Base
  has_many :products, class_name: 'OrderProduct', :dependent => :delete_all
  validates :email, presence: true
  validates :phone, presence: true
  accepts_nested_attributes_for :products

  before_save :cal_total

  private

  def cal_total
    products.each { |product| self.total += (product.price * product.quantity) }
  end
end
