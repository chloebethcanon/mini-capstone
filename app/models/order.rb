class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carted_products
  has_many :paintings, through: :carted_products
end
