class Order < ApplicationRecord
  belongs_to :user, dependent: :destroy
  enum status: [:cart, :payment, :deliver, :shipped, :cancelled]
  has_many :line_items, dependent: :destroy
end
