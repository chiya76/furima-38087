class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :price, :category_id, :status_id, :delivery_charge_id, :prefecture_id,
                                 :days_to_ship_id, :image).merge(user_id: current_user.id)
  end
end
