class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  validates :status, presence: true, inclusion: { in: %w(ordered completed cancelled) }

end
