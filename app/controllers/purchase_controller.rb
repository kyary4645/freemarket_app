class PurchaseController < ApplicationController
  before_action :set_credit
  require 'payjp'
  
  def show
    @item = Item.find(params[:id])
    if @credit.present?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      customer = Payjp::Customer.retrieve(@credit.customer_id)
      @credit_information = customer.cards.retrieve(@credit.card_id)
      @credit_brand = @credit_information.brand
    end
  end

  def pay
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      customer: @credit.customer_id,
      card: params['payjp-token'],
      currency: 'jpy'
    )
    redirect_to done_item_purchase_index_path
  end

  def done
  end

  private

  def item_params
    params.require(:item).permit(
    :name, :size, :status, :derivery_fee, :derivery_method,
    :price, :derivery_estimated, :description, :image, :category1, :category2, :category3, :brand, :prefecture_id).merge(user_id: current_user.id)
  end
    
  def set_credit
    @credit = Credit.find_by(user_id: current_user.id)
  end

  # def set_item
  #   @item = Item.find(params[:id])
  # end
end
