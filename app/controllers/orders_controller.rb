class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :move_to_index, :order_index]
  before_action :move_to_index
  before_action :order_index

  def index
    @order = UserItem.new
  end

  def create
    @order = UserItem.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  private

  def order_params
    params.permit(:token, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_to_index
     if user_signed_in? && current_user.id == @item.user_id
        redirect_to root_path
     end
  end

  def order_index
      unless @item.order.nil?
        redirect_to root_path
      end
  end
end
