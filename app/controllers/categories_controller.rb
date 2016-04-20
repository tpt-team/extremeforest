class CategoriesController < ApplicationController
  expose(:category)
  expose(:categories)

  def create
    category.save
  end

  def update
    create
  end

  def destroy
    category.destroy
  end

end
