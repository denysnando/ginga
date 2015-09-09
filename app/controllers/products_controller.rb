class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @products = Product.all
     respond_with(@products)
  end

  def show

  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
      if @product.save
        flash[:notice] = 'Produdo criado com sucesso!'
        redirect_to products_path
      else
        redirect_to new_product_path
      end
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(product_params)
      if @product.save
        flash[:notice] = 'Produto editado com sucesso!'
        redirect_to products_path
      else
        redirect_to edit_product_path(@product)
      end
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :number_references)
    end
end
