class MenuController < ApplicationController
  def index
    @items=Item.all
    @categories = Category.includes(:items).all
    @order_item=current_order.order_items.new
  end
   def category
    category = Category.find(params[:id])
    @items = category.items

    render partial: 'menu/category_items', locals: { items: @items }
  end
end
