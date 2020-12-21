class LineItem < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :order
  before_save :set_price
end

private

def set_price
  self.price  = product.price*quantity
end
en
