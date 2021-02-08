class ProductColorsController < ApplicationController
 
  before_action :set_product_color, only: [:show, :edit, :update, :destroy]

  def index
    @product_colors = ProductColor.all
  end

  def show
  end

  def edit
    @product_color = ProductColor.find(params[:id])
  end

  def new
    @product_color = ProductColor.new
  end

  def create
    @product_color = ProductColor.new(product_color_params)

    if @product_color.save
      redirect_to @product_color, notice: "Cor de Produto criado com sucesso !!!"
    else
      render :new
    end
  end

  def update
    if @product_color.update(product_color_params)
      redirect_to @product_color, notice: "Cor de Produto atualizado com sucesso !!!"
    else
      render :edit
    end
  end

  def destroy
    @product_color.destroy
    redirect_to @product_color, notice: "Cor de Produto excluido com sucesso !!!"
  end

  private

  def set_product_color
    @product_color = ProductColor.find(params[:id])
  end

  def product_color_params
    params.require(:product_color).permit(:id, :description)
  end

end
