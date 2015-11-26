class OrdersController < ApplicationController


def create
  painting_id = params[:painting_id]
  @painting = Painting.find_by(id: painting_id)
  quantity = params[:quantity].to_d
  subtotal = @painting.price * quantity
  tax = subtotal * Painting::SALES_TAX
  total = subtotal + tax
  order = Order.create(
    user_id: current_user.id,
    quantity: params[:quantity],
    painting_id: params[:painting_id],
    subtotal: subtotal,
    tax: tax,
    total: total
    )
  flash[:success] = "Order successfully created."
  redirect_to "/orders/#{order.id}"
end

def show
  order_id = params[:id]
  @order = Order.find_by(id: order_id)
end

end
