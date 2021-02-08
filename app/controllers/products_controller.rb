class ProductsController < ApplicationController
  
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.search(params[:search])
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

  def product_params
    params.require(:product).permit(:product_type_id, :description, :reference, :product_composition_id,
                   :product_color_id, :product_size_id, :supplier_id, :status, :search, :q)
  end

  def prepare_form
    @product_types = ProductType.all.map { |type| [type.description, type.id] }
    @product_colors = ProductColor.all.map { |color| [color.description, color.id] }
    @product_sizes = ProductSize.all.map { |size| [size.description, size.id] }
    @product_compositions = ProductComposition.all.map { |composition| [composition.description, composition.id] }
    @sesuppliers = Supplier.all.map { |supplier| [supplier.supplier_name, supplier.id] }
  end

end
