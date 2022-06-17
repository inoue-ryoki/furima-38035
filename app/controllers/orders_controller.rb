class OrdersController < ApplicationController

  def index

     @order = Order.new
     @item = Item.find(params[:item_id])
  end

   def create
   @item = Item.find(params[:item_id])
   @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end

  end


    private
  def order_params
     params.require(:order).permit(:post_code, :area_id, :city, :house_number, :build_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
