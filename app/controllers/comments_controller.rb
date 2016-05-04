class CommentsController < ApplicationController
  expose(:product)
  expose(:comment)

  def create
    comment = Comment.new(comment_params)
    if comment.update(comment_params)
      comment.update_attributes(product_id: product.id, user_id: current_user.id)
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    create
  end

  def destroy
    comment.destroy
  end

private

  def comment_params
    params[:comment].permit!
  end

end
