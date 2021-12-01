class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    #@items = Item.all
    #@items = Item.includes(:user).order('created_at DESC')
    @items = Item.all.order(created_at: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:product_name,:description,:category_id,:product_condition_id,:delivery_fee_id,:prefecture_id,:days_to_ship_id,:price,:image).merge(user_id: current_user.id)
  end


end