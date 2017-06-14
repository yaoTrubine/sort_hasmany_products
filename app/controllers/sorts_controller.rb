class SortsController < ApplicationController
  layout "admin", only: [:new]
  def index
    @sorts = Sort.all
  end
  def new
    @sort = Sort.new
  end
  def create
    @sort = Sort.new(sort_params)
    if @sort.save
      redirect_to sorts_path, notice: "添加分类成功!"
    else
      render :new
    end
  end
  private
    def sort_params
      params.require(:sort).permit(:name)
    end
end
