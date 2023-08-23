class Item < ApplicationRecord
   has_many :categorizations
  has_many :categories, through: :categorizations


  validates :title, :description, :price, presence: true
  validates :title, uniqueness: true
  validates :title, :description, presence: true
  validates :price, numericality: { greater_than: 0 }
  validate :valid_decimal_price



  private

  def valid_decimal_price
    if price.present? && !price.to_s.match(/\A\d+(\.\d{1,2})?\z/)
      errors.add(:price, "must be a valid decimal numeric value")
    end
  end
end





