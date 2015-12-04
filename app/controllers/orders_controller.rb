class OrdersController < ApplicationController

before_action :authenticate_user!

def create

  @carted_products = CartedProduct.where(user_id: current_user.id, status: "Carted") 

  @order = Order.create(
    user_id: current_user.id,
    subtotal: params[:subtotal],
    tax: params[:tax],
    total: params[:total]
    )

  @carted_products.update_all(status: "Purchased", order_id: @order.id)

  flash[:success] = "Order successfully created."
  redirect_to "/orders/#{@order.id}"

end

def show
  @order_id = params[:id]
  @order = Order.find_by(id: @order_id)
end

end
