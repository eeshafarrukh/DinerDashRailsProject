class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include ApplicationHelper
  before_action :create_new_order
  before_action :set_render_cart
  before_action :initialize_cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
  end

  def set_render_cart
    @render_cart = true
  end

  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])

    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

  def current_cart
    @cart ||= Cart.find_by(id: session[:cart_id])

    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end

    @cart
  end

  def create_new_order
    @order = Order.create
    session[:order_id] = @order.id
    @order_id = @order.id # Set @order_id to the ID of the newly created order
  end
end