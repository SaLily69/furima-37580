class ItemsController < ApplicationController

  def new
    authenticate_user!
    @item = Item.new
  end
  
end
