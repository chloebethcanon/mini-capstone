class CartedProductsController < ApplicationController

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

end
