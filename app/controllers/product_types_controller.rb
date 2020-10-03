class ProductTypesController < ApplicationController
   
  before_action :set_produtct_type, only: [:edit, :create, :update, :destroy]

  def index
    @product_types = Product_Type.all
  end

  def show
  end

  def edit
  end

  def new
    @product_type = Product_Type.new
  end

  def create
    @product_type = Product_Type.new(product_type_params)

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
      redirect_to :edit
    end
  end

  def destroy
    @product_type.destroy
    redirect_to @product_type, notice: "Tipo de Produto excluido com sucesso !!!"
  end

  private

  def set_produtct_type
    @product_type = Product_Type.find(params[:id])
  end

  def product_type_params
    parms.require(:product_type).permit(:description)
  end

end
