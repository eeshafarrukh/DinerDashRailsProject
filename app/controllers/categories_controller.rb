
class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  private
  def authorize_admin
    unless current_user&.admin?
      redirect_to root_path, alert: 'Access denied.'
    end
  end
  def category_params
    params.require(:category).permit(:name)
  end
end
