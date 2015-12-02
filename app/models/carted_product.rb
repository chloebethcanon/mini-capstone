class CartedProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :painting
  belongs_to :order
end
