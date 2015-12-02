class Painting < ActiveRecord::Base

  belongs_to :user
  belongs_to :supplier
  has_many :orders
  has_many :images
  has_many :categorized_paintings
  has_many :categories, through: :categorized_paintings
  has_many :carted_products

  SALES_TAX = 0.09

  def description_list
    description.split(", ")
  end

  def sale_message
    if price.to_f <= 100.00 
      "Discount Item!"
    end

    # Another way to write this code:
    # price.to_f <= 50.00 ? "Discount Item!" : "On Sale!"
  end

  def tax
    @tax_amount = price * SALES_TAX
  end

  def total_price
    total_price = price + @tax_amount
  end

  def in_stock
    if false
      "Out of Stock"
    end
  end

  
end
