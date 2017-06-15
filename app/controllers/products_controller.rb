class ProductsController < ApplicationController
  layout "admin", only: [:new,:create]
  def index
      @products = Product.all
      @sort = Sort.find(params[:sort_id])
      @product = Product.find_by(id: params[:id])
  end

  def new
      @sort = Sort.find(params[:sort_id])
      @product = Product.new
  end

   def create
        @sort = Sort.find(params[:sort_id])
        @product = Product.new(product_params)
        @product.sort = @sort

        if @product.save
            redirect_to root_path, notice: "添加商品成功!"
        else
            render :new
        end
    end


    def show
        @product = Product.find_by(id: params[:id])
    end

    private
        def product_params
            params.require(:product).permit(:name,:number)
        end

end
