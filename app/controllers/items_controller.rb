class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy,:retire]
  before_action :authorize_admin, only: [:new, :create, :edit, :update, :destroy,:retire]
  def retire
    @item = Item.find(params[:id])
    @item.update(retired: true)
    redirect_to @item, notice: 'Item was retired successfully.'
  end
  def index
    @items = Item.all
  end
  def show
    authorize @item 
  end
  def new
    @item = Item.new
    authorize @item 
    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def create
    @item = Item.new(item_params)
    @item.retired = false # Set retired to false for new items
    puts @item.inspect # Debug statement to inspect @item
    authorize @item 
      
    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end
  def edit
    @item = Item.find(params[:id])
    authorize @item
  end

  def update
    authorize @item

    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @item
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end
  def assign_categories
    authorize @item

    if @item.update(item_params)
      redirect_to item_path(@item), notice: 'Categories were successfully assigned to the item.'
    else
      render :edit
    end
  end
  private
  
  def set_item
    @item = Item.find(params[:id])
  end
  def authorize_admin
    unless current_user.admin?
      redirect_to root_path, alert: 'Access denied.' 
    end
  end
  
  def item_params
    params.require(:item).permit(:title, :description, :price, :retired, category_ids: [])
  end

end
