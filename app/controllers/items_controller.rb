class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:edit, :destroy]

  def index
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

  def edit
    unless set_user
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
       redirect_to item_path(item_params)
    else
      render :edit
    end
  end

  def destroy
    if set_user
    @item.destroy
      redirect_to root_path
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:product_name,:description,:category_id,:product_condition_id,:delivery_fee_id,:prefecture_id,:days_to_ship_id,:price,:image).merge(user_id: current_user.id)
  end

  def set_user
     user_signed_in? && current_user.id == @item.user_id
  end

end