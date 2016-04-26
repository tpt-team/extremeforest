class ProductsController < ApplicationController
  expose(:product)
  expose(:products) # { |default| default.scopedproduct(params) }
  expose(:categories)
  expose(:subcategories)

  def index
    @products = products.scopedproduct(params)
  end

  def create
    product.save
  end

  def update
    create
  end

  def destroy
    product.destroy
  end

end
