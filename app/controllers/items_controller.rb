class ItemsController < ApplicationController

  def new
    authenticate_user!
    @item = Item.new
  end
  
  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :product_name, :product_text, :product_category_id, :product_condition_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

end
