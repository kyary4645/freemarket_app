class UsersController < ApplicationController
  before_action :set_user, only:[:show, :tab1,:tab2, :tab3]




  def show
  end

  def tab1
  end

  def tab2
  end

  def tab3
  end

  private
  def set_user
    @user = User.find(params[:id])
    @items = @user.items
  end



end
