class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @items = Item.all.order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    if user_signed_in?
      @item = Item.find(params[:id])
      move_to_index
    end 
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item_path
    else
      @item = item
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :product_name, :product_text, :product_category_id, :product_condition_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
