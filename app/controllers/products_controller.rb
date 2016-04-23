class ProductsController < ApplicationController
  expose(:product)
  expose(:products) { |default| default.by_category(params[:id]).page(params[:page]).per(8) }
  expose(:categories)

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
