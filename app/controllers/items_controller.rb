class ItemsController < ApplicationController
  require "payjp"
  before_action :set_item, only: [:edit, :show, :destroy, :pay, :purchase]

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
  end  

  def edit
  end  

  def show
  end

  def purchase

  end

  def pay
    Payjp.api_key = "sk_test_4854d0c360476b8cab020092"
    charge = Payjp::Charge.create(
      amount: 300,
      customer: "cus_41a602e8723ab96b36f58dd2302f",
      currency: 'jpy'
    )
    redirect_to action: :done
  end

  def done
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

  # def profile_params
  #   params.require(:profile).permit(
  #     :birth_year,
  #     :birth_month,
  #     :birth_day,
  #     :first_name,
  #     :last_name,
  #     :first_name_kana,
  #     :last_name_kana,
  #     :phone_number,
  #     :prefecture,
  #     :city,
  #     :house_number,
  #     :zip_code,
  #     :building).merge(user_id: current_user.id, profile_id: current_user.id)
  # end

end