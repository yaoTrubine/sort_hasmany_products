class OrdersController < ApplicationController
    layout "admin", only: [:index,:destroy]
     before_action :find_order, only: [:edit,:update,:destroy]
    def index
        @orders = Order.all
    end

    def new
        @order = Order.new
    end

    def create
        @order = Order.new(order_params)
        if @order.save
            redirect_to root_path, notice: "订单提交成功!"
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @order.update_attributes(order_params)
            redirect_to orders_path, notice: "已更新!"
        else
            render :edit
        end
    end

    def destroy
        
        @order.destroy if @order
        redirect_to orders_path, notice: "已删除!"
    end

    private
        def order_params
            params.require(:order).permit(:name,:email,:content)
        end

        def find_order
            @order = Order.find_by(id: params[:id])
        end
end
