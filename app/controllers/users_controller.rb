class UsersController < ApplicationController
  before_action :set_user, only:[:show, :tab1,:tab2, :tab3,:logout]
  before_action :move_to_index

  


  def show
  end

  def tab1
  end

  def tab2
  end

  def tab3
  end
  
  def profile
  end

  def personalinformation
    @user = User.find(params[:id])
    @profiles = @user.profile
    
  end  

  def logout
  end  

  
  private
  def set_user
    @user = User.find(params[:id])
    @items = @user.items
    @sell_items = @items.where(buyer_id: nil)
    @bought_items = @items.where.not(buyer_id: nil)
  end
  
  def move_to_index
    @user = User.find(params[:id])
    redirect_to root_path unless user_signed_in? && current_user.id == @user.id
  end

end
