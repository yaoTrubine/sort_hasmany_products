class ProductsController < ApplicationController
  layout "admin", only: [:new,:create,:edit]
  def index
      @sort = Sort.find(params[:sort_id])
  end

  def new
      @sort = Sort.find(params[:sort_id])
      @product = Product.new
  end

    def edit
        @product = Product.find_by(id: params[:id])
    end

    def update
        @product = Product.find_by(id: params[:id])
        if @product.update(product_params)
            redirect_to new_sort_path, notice: "修改产品成功!"
        else
            render :edit
        end
    end

   def create
        @sort = Sort.find(params[:sort_id])
        @product = Product.new(product_params)
        @product.sort = @sort

        if @product.save
            redirect_to new_sort_path, notice: "添加商品成功!"
        else
            render :new
        end
    end


    def show
        @product = Product.find_by(id: params[:id])
    end

    def destroy
        @product = Product.find_by(id: params[:id])
        @product.destroy if @product
        redirect_to new_sort_path, notice: "产品删除成功!"
    end

    private
        def product_params
            params.require(:product).permit(:name,:number)
        end

end
