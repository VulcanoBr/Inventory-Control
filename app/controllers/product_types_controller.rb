class ProductTypesController < ApplicationController

  include Paginable
   
  before_action :set_produtct_type, only: [:show, :edit, :update, :destroy]

  def index
    @product_types = ProductType.all.page(current_page).per(per_page)
  end

  def show
  end

  def edit
  end

  def new
    @product_type = ProductType.new
  end

  def create
    @product_type = ProductType.new(product_type_params)
    if @product_type.save
      redirect_to @product_type, notice: "Tipo de Produto criado com sucesso !!!"
    else
      render :new
    end
  end

  def update
    if @product_type.update(product_type_params)
      redirect_to @product_type, notice: "Tipo de Produto atualizado com sucesso !!!"
    else
      render :edit
    end
  end

  def destroy
    @product_type.destroy
    redirect_to @product_type, notice: "Tipo de Produto excluido com sucesso !!!"
  end

  private

  def set_produtct_type
    @product_type = ProductType.find(params[:id])
  end

  def product_type_params
    params.require(:product_type).permit(:id, :description)
  end

end
