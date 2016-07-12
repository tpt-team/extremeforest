class OrdersController < ApplicationController
  expose(:products) { |default| default.in_cart(cart) }
  def create
    return if cart.include? params[:id]
    cart << params[:id]
  end

  def update
    if order.update(order_params)
      session[:products] = []
      OrderMailer.new_order(order.id).deliver_later
    else
      render :new
    end
  end

  def destroy
    cart.delete(params[:id])
  end

  private

  def order
    @order ||= Order.new
  end
  helper_method :order

  def order_params
    params.require(:order).permit!.merge(user: current_user)
  end
end
