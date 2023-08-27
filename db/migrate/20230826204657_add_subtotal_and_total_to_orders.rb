class AddSubtotalAndTotalToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :subtotal, :decimal
    add_column :orders, :total, :decimal
  end
end
