class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: :index
  before_action :ordered_item, only: :index
  before_action :set_item, only: [index, create, ]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture, :municipality, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end

  def ordered_item
    redirect_to root_path if @item.orders.present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
