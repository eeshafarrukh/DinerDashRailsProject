class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_order, only: [:show, :cancel, :mark_as_paid, :mark_as_completed]

  def index
    @orders = policy_scope(Order)
  end
  def filter_by_status
    status = params[:status]
    @orders = policy_scope(Order.where(status: status))
    render :index
  end
  def show
   

    if current_user&.admin?
      authorize @order, :admin_show?
    elsif user_signed_in?
      authorize @order, :user_show?
    else
      authorize @order, :unauthenticated_show?
    end
  end

  def cancel
    authorize @order, :cancel?

    if @order.update(status: 'cancelled')
      redirect_to orders_path, notice: 'Order was successfully cancelled.'
    else
      redirect_to orders_path, alert: 'Failed to cancel the order.'
    end
  end

  def mark_as_paid
    authorize @order, :mark_as_paid?

    if @order.update(status: 'paid', user_id: @order.user_id)
      redirect_to orders_path, notice: 'Order was marked as paid.'
    else
      redirect_to orders_path, alert: 'Failed to mark the order as paid.'
    end
  end

  def mark_as_completed
    authorize @order, :mark_as_completed?

    if @order.update(status: 'completed')
      redirect_to orders_path, notice: 'Order was marked as completed.'
    else
      redirect_to orders_path, alert: 'Failed to mark the order as completed.'
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
