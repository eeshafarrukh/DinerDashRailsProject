class OrderItemsController < ApplicationController
  before_action :set_order

  def create
    @order_item = @order.order_items.new(order_params)
    @order_item.order_id = @order_id # Use the @order_id instance variable

    if @order_item.save
      flash[:notice] = 'Order item was successfully added.'
    else
      flash[:alert] = 'Error adding order item.'
    end
  end

  def update
    @order_item = current_order.order_items.find(params[:id])
    @order_item.update_attributes(order_params)
    @order_items = current_order.order_items
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = current_order.order_items
  end

  private

  # Define the order_params method with necessary attributes
  def order_params
    params.require(:order_item).permit(:item_id, :quantity)
  end

  def set_order
    if session[:order_id]
      @order = Order.find(session[:order_id])
    else
      @order = Order.create
      session[:order_id] = @order.id
    end
  end
end