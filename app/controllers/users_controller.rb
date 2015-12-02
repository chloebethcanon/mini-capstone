class UsersController < ApplicationController

  def cart
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "Carted")
    
  end

end
