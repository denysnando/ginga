class Admin::CategoriesController < Admin::ApplicationController
  before_action :authenticate_user!
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
        redirect_to admin_categories_path
      else
        redirect_to new_admin_category_path
      end
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(category_params)
      if @category.save
        flash[:notice] = 'Categoria editada com sucesso!'
        redirect_to admin_categories_path
      else
        redirect_to edit_admin_category_path(@category)
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
