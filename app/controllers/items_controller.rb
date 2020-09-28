class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end  
  end

  def set_item
    @item = Item.find(params[:id])
  end
  

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :postage_id, :area_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    if user_signed_in? && current_user.id != @item.user_id
       redirect_to root_path
    end
  end
end
