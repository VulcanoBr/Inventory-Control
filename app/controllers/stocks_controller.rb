class StocksController < ApplicationController

  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  def index
    @stocks = Stock.all
  end

  def show
    prepare_form_stock

  end

  def new
    prepare_form_stock
    @stock = Stock.new
  end

  def edit
    prepare_form_stock
  end

  def create
    @stock = Stock.new(stock_params) 
    
    if @stock.save
      redirect_to @stock, notice: "Estoque criado com sucesso !!! "
    else
      prepare_form_stock
      render :new
    end
  end

  def update
    if @stock.update(stock_params)
      redirect_to @stock, notice: "Estoque alterado com sucesso !!! "
    else
      prepare_form_stock
      render :edit
    end
  end

  def destroy
    @stock.destroy
    redirect_to stocks_url, notice: "Estoque excluido com sucesso"
  end

  private

  def set_stock
    @stock = Stock.find(params[:id])
  end

  def stock_params
    params.require(:stock).permit(:id, :product_id, :minimum_quantity, :quantity, :last_unit_price, :description)
  end

  def prepare_form_stock
    @products = Product.all.map { |prod| [prod.product_type.description + " " + 
              prod.description + " " + prod.product_color.description + " " +
              prod.product_composition.description + " " + prod.product_size.description + " " + 
              prod.supplier.supplier_name, prod.id, ] }
    
  end
end
