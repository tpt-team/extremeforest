class ProductsController < ApplicationController
  expose(:product)
  expose(:products) { |default| default.page(params[:page]).per(8) }

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
