class OrdersController < ApplicationController
    before_action :authenticate_user!, only: [:index]
    before_action :set_item, only: [:index, :create]
  def index
    @order = Order.new
    redirect_to items_path if @item.buyer.present? || @item.user_id == current_user&.id
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item

      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private



  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order).permit(:post_code, :area_id, :city, :house_number, :build_name, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
