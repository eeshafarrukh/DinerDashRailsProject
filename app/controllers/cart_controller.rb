# app/controllers/cart_controller.rb
class CartController < ApplicationController
   before_action :authenticate_user!, only: :checkout
  def show #remove 
    @order_items=current_order.order_items
  end

  def add  #set_item function in before_action call
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
  def checkout
  @order = current_user.orders.create(status: "ordered")
  @cart.orderables.each do |orderable|
    @order.order_items.create(item: orderable.item, quantity: orderable.quantity)
  end

  # Delete associated orderables before destroying the cart
  @cart.orderables.destroy_all  # add dependent destroy callback

  # Clear the cart after successful checkout
  @cart.destroy
  session[:cart_id] = nil

  redirect_to order_path(@order), notice: "Order successfully placed!"
end

end
