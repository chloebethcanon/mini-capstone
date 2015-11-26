class OrdersController < ApplicationController


def create
  Order.create(
    user_id: current_user.id,
    quantity: params[:quantity] 
    )
  flash[:success] = "Order successfully created."
  redirect_to '/orders/:id'
end

def show
end

end
