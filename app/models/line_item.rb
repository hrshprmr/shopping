class LineItem < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :product, dependent: :destroy
  belongs_to :order, dependent: :destroy

#   belongs_to :product
#   before_create :set_price
#   def set_price
#     # self.order_id = 1
#    self.price = product.price*quantity
#  end

#  def sub_total
#   sum = 0
#   self.line_items.each do |line_item|
#     sum+= line_item.total_price
#   end
#   return sum
# end
end
