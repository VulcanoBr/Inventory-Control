class ProductCompositionsController < ApplicationController

  before_action :set_produtct_composition, only: [:edit, :create, :update, :destroy]

  def index
    @product_compositions = Product_Composition.all
  end

  def show
  end

  def edit
  end

  def new
    @product_composition = Product_Composition.new
  end

  def create
    @produtct_composition = Product_Compositionset.new(produtct_composition_params)

    if @produtct_composition.save
      redirect_to @produtct_composition, notice: "Composição de Produto criado com sucesso !!!"
    else
      render :new
    end
  end

  def update
    if @produtct_composition.update(produtct_composition_params)
      redirect_to @set_produtct_composition, notice: "Composição de Produto atualizado com sucesso !!!"
    else
      redirect_to :edit
    end
  end

  def destroy
    @produtct_composition.destroy
    redirect_to @produtct_composition, notice: "Cormposição de Produto excluido com sucesso !!!"
  end

  private

  def set_produtct_composition
    @set_produtct_composition = Product_Composition.find(params[:id])
  end

  def produtct_composition_params
    parms.require(:produtct_composition).permit(:description)
  end
end
