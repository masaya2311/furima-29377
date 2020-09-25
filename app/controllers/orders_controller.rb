class OrdersController < ApplicationController
  before_action :move_to_index
  before_action :order_index
  def index
    @item = Item.find(params[:item_id])
    @order = UserItem.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = UserItem.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
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
    @item = Item.find(params[:item_id])
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end

  def order_index
    @item = Item.find(params[:item_id])
    redirect_to root_path unless @item.order.nil?
  end
end
