class OrdersController < ApplicationController


    def index
      @item_order = ItemOrder.new
    end
  
    def create
      @item_order = ItemOrder.new(order_params)
      if @item_order.valid?
        @item_order.save
        return redirect_to root_path
      else
        render : :index
      end
    end
  


end
