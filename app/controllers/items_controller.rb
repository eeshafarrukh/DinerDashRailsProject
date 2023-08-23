class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @items = Item.all
  end
  def show
    authorize @item 
  end
  def new
    @item = Item.new
    authorize @item 
  end

  def create
    @item = Item.new(item_params)
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
  private
  
  def set_item
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:title, :description, :price)
  end
end
