class OrderAdmin::OrdersController < OrderAdmin::AdminsController
  expose :order
  expose(:orders) { |default| default.order('created_at DESC').page(params[:page]).per(10) }

  def update
    order.update(order_params)
    redirect_via_turbolinks_to order_admin_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
