class AddCartReferenceToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_items, :cart, foreign_key: true
  end
end
