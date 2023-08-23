class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  def show
    if user_signed_in?
      if current_user.admin?
        authorize @order, :admin_show? # Authorize admin to access order details
      else
        authorize @order, :user_show? # Authorize user to access their order details
      end
    else
      authorize @order, :unauthenticated_show? # Authorize unauthenticated user to access order details
    end
  end
  private
  
  def set_order
    @order = Order.find(params[:id])
  end
  
  
end
