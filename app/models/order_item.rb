class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  before_save :set_unit_price
  before_save :set_total

  def unit_price
    if persisted?
      self[:unit_price]
    else
      item&.price
    end
  end


  def total
    return unit_price * quantity.to_i unless unit_price.nil? || quantity.nil?
    return 0
  end



  def set_unit_price
    self[:unit_price] = unit_price
  end

 

  def set_total
    self[:total] = total * quantity
  end
end
