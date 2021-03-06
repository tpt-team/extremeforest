class ProductsController < ApplicationController
  impressionist actions: [:show]
  expose(:product)
  expose(:products) # { |default| default.scopedproduct(params) }
  expose(:categories)
  expose(:subcategories)
  expose(:comments)

  def index
    @products = products.scopedproduct(params)
  end

  def create
    product.save
  end

  def show
    impressionist(product)
  end

  def update
    create
  end

  def destroy
    product.destroy
  end
end
