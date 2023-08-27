# app/controllers/cart_controller.rb
class CartController < ApplicationController
  def show
    @order_items=current_order.order_items
   
  end

  def add
    @item = Item.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = current_cart.orderables.find_by(item_id: @item.id)

    if current_orderable && quantity > 0
      current_orderable.update(quantity: quantity)
      added_or_updated = 'updated'
    elsif quantity <= 0 && current_orderable
      current_orderable.destroy
      added_or_updated = 'removed'
    elsif quantity > 0
      current_cart.orderables.create(item: @item, quantity: quantity)
      added_or_updated = 'added'
    end

    respond_to do |format|
      format.html { redirect_to menu_path }
      format.json { render json: { status: added_or_updated } }
    end
  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
    @cart_updated = true
    respond_to do |format|
      format.html { redirect_to menu_path }
      format.js   # Render remove.js.erb template
    end
  end
end
