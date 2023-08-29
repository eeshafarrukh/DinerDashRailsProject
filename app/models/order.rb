 class Order < ApplicationRecord
  before_save :set_subtotal
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  validates :status, presence: true, inclusion: { in: %w(ordered completed cancelled paid) }
  def subtotal
    order_items.collect { |order_item| order_item.valid? ? (order_item.unit_price&. * order_item.quantity.to_i) : 0 }.sum
  end
  private 
  def set_subtotal
    self[:subtotal]=subtotal
  end
end
