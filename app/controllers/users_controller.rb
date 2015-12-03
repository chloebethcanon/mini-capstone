class UsersController < ApplicationController

  def cart
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "Carted")
    
    @subtotal = []
    @carted_products.each do |carted_product|
      @subtotal << carted_product.painting.price * carted_product.quantity
    end
    
    @subtotal = @subtotal.sum

    @tax = @subtotal * Painting::SALES_TAX
    
    @total = @subtotal + @tax

  end

end
