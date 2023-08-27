class RevertChangeOrderItemIdInOrderItems < ActiveRecord::Migration[5.2]
  def up
    change_column :order_items, :order_id, :integer, null: false
  end

  def down
    change_column :order_items, :order_id, :integer, null: true
  end
end
