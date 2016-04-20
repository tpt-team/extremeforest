class ProductsController < ApplicationController
  expose(:product)
  expose(:products)

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
