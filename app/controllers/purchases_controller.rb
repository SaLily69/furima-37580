class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_shipping = PurchaseShipping.new
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      @purchase_shipping.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:post_number, :prefecture_id, :city, :address, :house_number, :tel, :purchase_id).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
