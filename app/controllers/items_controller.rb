class ItemsController < ApplicationController
  before_action :set_item, only: [ :show, :destroy, :edit, :update]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new, notice: '保存できませんでした'
    end
  end


  def destroy
    if @item.destroy
      redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
    else
      render :new, notice: "削除しました"
    end
  end  

  def edit

  end  

  def update

    
    if @item.update(item_params)
      redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
    else  
      render :edit, notice: "編集しました"
    end
    

  end


  

  def show
  end

  

  private

  def item_params
    params.require(:item).permit(
      :name, :size, :status, :derivery_fee, :derivery_method,
      :price, :derivery_estimated, :description, :image, :category1, :category2, :category3, :brand, :prefecture_id).merge(user_id: current_user.id)
  end  

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end