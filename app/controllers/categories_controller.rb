class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  #def edit
  #end

  def create
    @category = Category.new(category_params)
      if @category.save
        flash[:notice] = 'Categoria criada com sucesso!'
        redirect_to categories_path
      else
        redirect_to new_category_path
      end
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(category_params)
      if @category.save
        flash[:notice] = 'Categoria editada com sucesso!'
        redirect_to categories_path
      else
        redirect_to edit_category_path(@category)
      end
  end

  def destroy
    @category.destroy
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
