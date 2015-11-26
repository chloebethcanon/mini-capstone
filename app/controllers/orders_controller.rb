class OrdersController < ApplicationController


def create
  order = Order.create(
    user_id: current_user.id,
    quantity: params[:quantity],
    painting_id: params[:painting_id] 
    )
  flash[:success] = "Order successfully created."
  redirect_to "/orders/#{order.id}"
end

def show
  order_id = params[:id]
  @order = Order.find_by(id: order_id)
end

end
