class SortsController < ApplicationController
  layout "admin", only: [:new]
  def index
    @sorts = Sort.all
  end

  def new
    @sorts = Sort.all
    @sort = Sort.new
  end

  def create
    @sort = Sort.new(sort_params)
    if @sort.save
      redirect_to new_sort_path, notice: "添加分类成功!"
    else
      render :new
    end
  end

  def destroy
    @sort = Sort.find_by(id: params[:id])
    @sort.destroy if @sort
    redirect_to new_sort_path, notice: "分类已删除!"
  end
  private
  def sort_params
  params.require(:sort).permit(:name)
  end
end
