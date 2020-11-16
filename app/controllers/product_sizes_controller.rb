class ProductSizesController < ApplicationController
   
  before_action :set_product_size, only: [:show, :edit, :update, :destroy]

  def index
    @product_sizes = ProductSize.all
  end

  def show
  end

  def edit
  end

  def new
    @product_size = ProductSize.new
  end

  def create
    @product_size = ProductSize.new(product_size_params)

    if @product_size.save
      redirect_to @product_size, notice: "Tamanho de Produto criado com sucesso !!!"
    else
      render :new
    end
  end

  def update
    if @product_size.update(product_size_params)
      redirect_to @product_size, notice: "Tamanha de Produto atualizado com sucesso !!!"
    else
      redirect_to :edit
    end
  end

  def destroy
    @product_size.destroy
    redirect_to @product_size, notice: "Tamanho de Produto excluido com sucesso !!!"
  end

  private

  def set_product_size
    @product_size = ProductSize.find(params[:id])
  end

  def product_size_params
    params.require(:product_size).permit(:id, :description)
  end

end

