class CartedProductsController < ApplicationController

  before_action :authenticate_user!
  
  def create
    carted_product = CartedProduct.create(
      user_id: current_user.id,
      painting_id: params[:painting_id],
      quantity: params[:quantity],
      status: "Carted"
      )
    redirect_to "/users/#{current_user.id}/cart"
  end

  def show
  end

  def edit
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.update(status: "Removed")
    flash[:success] = "Item successfully removed from cart."
    redirect_to "/carted_products"
  end

end
