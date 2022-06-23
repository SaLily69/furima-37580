class ItemsController < ApplicationController

  def new
    authenticate_user!
  end
  
end
