class ProductsController < ApplicationController

  include Paginable
  
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    if search_params[:q].blank?
      @products = Product.all.page(current_page).per(per_page)
    else
      @products = Product.search(search_params[:q]).page(current_page).per(per_page)
    end
  end

  def show
    prepare_form
  end

  def new
    prepare_form
    @product = Product.new
  end

  def edit
    prepare_form
  end

  def create
    @product = Product.new(product_params) 
    if @product.save
      redirect_to @product, notice: "Produto salvo com sucesso !!! "
    else
      prepare_form
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Produto alterado com sucesso !!! "
    else
      prepare_form
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: "Produto excluido com sucesso"
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def search_params
    params.permit(:q)
  end

  def product_params
    params.require(:product).permit(:product_type_id, :description, :product_composition_id,
                   :product_color_id, :product_size_id, :status)
  end

  def prepare_form
    @product_types = ProductType.order(:description).all.map { |type| [type.description, type.id] }
    @product_colors = ProductColor.order(:description).all.map { |color| [color.description, color.id] }
    @product_sizes = ProductSize.order(:description).all.map { |size| [size.description, size.id] }
    @product_compositions = ProductComposition.order(:description).all.map { |composition| [composition.description, composition.id] }
    
  end

end
