class CategoriesController < ApplicationController
  expose(:category)
  
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
