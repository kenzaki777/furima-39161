class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :road_item,only:[:new,:create]
  before_action :judgment_user_sold_out,only:[:new]
  before_action :judgment_user_item,only:[:new]

  def new
    @record_shipping_address = RecordShippingAddress.new
  end
  def create
    @record_shipping_address = RecordShippingAddress.new(record_params)
    if @record_shipping_address.valid?
      pay_item
      @record_shipping_address.save
      redirect_to root_path
    else
      render :new
    end
  end
  private

  def record_params
    params.require(:record_shipping_address).permit(:post_code, :sender_area_id, :municipalities, :address, :building_name, :telephone_number).merge(item_id: params[:item_id], user_id: current_user.id,token: params[:token])
  end
  def road_item
    @item = Item.find(params[:item_id])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,
      card: record_params[:token],
      currency: 'jpy'
    )    
  end
  def judgment_user_sold_out
    if @item.record.present?
      redirect_to root_path
    end
  end
  def judgment_user_item
    if current_user == @item.user
      redirect_to root_path
    end
  end

end
