class LineItem < ApplicationRecord
  belongs_to :product
  before_create :set_price
  def set_price
    # self.order_id = 1
   self.price = product.price*quantity
 end

end
