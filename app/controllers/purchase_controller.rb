class PurchaseController < ApplicationController
  def index
    @item = Item.find(item_params)
  end

  def done
  end

  private
  def item_params
    params.require(:item).permit(
      :name, :size, :status, :derivery_fee, :derivery_method,
      :price, :derivery_estimated, :description, :image, :category1, :category2, :category3, :brand, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end  
end
