class Painting < ActiveRecord::Base

  def description_list
    description.split(", ")
  end

  def sale_message
    if price.to_f <= 100.00 
      "Discount Item!"
    else
      "On Sale!"
    end

    # Another way to write this code:
    # price.to_f <= 50.00 ? "Discount Item!" : "On Sale!"
  end

  def tax
    @tax_amount = price * 0.09
    sprintf "%.2f", @tax_amount
  end

  def total_price
    total_price = price + @tax_amount
    sprintf "%.2f", total_price
  end

  def in_stock
    if false
      "Out of Stock"
    end
  end
  
end
