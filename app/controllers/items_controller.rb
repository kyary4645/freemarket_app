class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :destroy, :update]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.where(buyer_id: nil).includes(:user)
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: "出品完了やで！！！"
    else 
      render :new, alert: '出品できませんでした'
    end
  end


  def destroy
    if @item.destroy
      redirect_to root_path, notice: "削除しました" if user_signed_in? && current_user.id == @item.user_id 
    else
      render :new, alert: "削除できませんでした"
    end
  end  

  def edit

  end  

  def update

    
    if @item.update(item_params)
      redirect_to root_path, notice: "編集完了したで" if user_signed_in? && current_user.id == @item.user_id
    else  
      render :edit, alert: "編集できませんでした"
    end
    
  end

  def show
    @user = @item.user_id
    @items = Item.where(user_id: @user)
  end


  def search
    @items = Item.search(params[:keyword])
  end


  private

  def item_params
    params.require(:item).permit(
      :name, :size, :status, :derivery_fee, :derivery_method,
      :price, :derivery_estimated, :description, :image, :category1, :category2, :category3, :brand, :prefecture_id, :buyer_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end