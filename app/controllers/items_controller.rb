class ItemsController < ApplicationController
  def index
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
  
  private

  def item_params
     params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :postage_id, :area_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end
end