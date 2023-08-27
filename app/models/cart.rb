class Cart < ApplicationRecord
	has_many :orderables
  has_many :items, through: :orderables

  def total
    orderables.sum { |orderable| orderable.total }
  end
end

# app/models/orderable.rb
