class ProductCompositionsController < ApplicationController

  before_action :set_product_composition, only: [:show, :edit, :update, :destroy]

  def index
    @product_compositions = ProductComposition.all
  end

  def show
  end

  def edit
  end

  def new
    @product_composition = ProductComposition.new
  end

  def create
    @product_composition = ProductComposition.new(product_composition_params)

    if @product_composition.save
      redirect_to @product_composition, notice: "Composição de Produto criado com sucesso !!!"
    else
      render :new
    end
  end

  def update
    if @product_composition.update(product_composition_params)
      redirect_to @product_composition, notice: "Composição de Produto atualizado com sucesso !!!"
    else
      render :edit
    end
  end

  def destroy
    @product_composition.destroy
    redirect_to @product_composition, notice: "Cormposição de Produto excluido com sucesso !!!"
  end

  private

  def set_product_composition
    @product_composition = ProductComposition.find(params[:id])
  end

  def product_composition_params
    params.require(:product_composition).permit(:id, :description)
  end
end
