class Order < ActiveRecord::Base
  belongs_to :painting
  belongs_to :user
  has_many :carted_products

end
