class UsersController < ApplicationController
	before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    authorize @user
  end
  def orders
    @user = User.find(params[:id])
    authorize @user, :orders?
    @orders = @user.orders
  end

end
