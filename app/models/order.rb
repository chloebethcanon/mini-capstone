class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carted_products
  has_many :paintings, through: :carted_products

  # validates :carted_products
  validates :user_id, presence: true
  validates :subtotal, :tax, :total, presence: true
  validates :subtotal, :tax, :total, numericality: true
  validates :subtotal, :tax, :total, numericality: { :greater_than => 0 }
end
