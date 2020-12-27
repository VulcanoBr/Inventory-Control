class StockOutsController < ApplicationController
  before_action :set_stock_out, only: [:show, :edit, :update, :destroy]

  def index
    @stock_outs = StockOut.all
  end

  def show
    prepare_form_stock_out

  end

  def new
    prepare_form_stock_out
    @stock_out = StockOut.new
  end

  def edit
    prepare_form_stock_out
  end

  def create
    @stock_out = StockOut.new(stock_out_params) 
    
    if @stock_out.save
      redirect_to @stock_out, notice: "Saida do Estoque criado com sucesso !!! "
    else
      prepare_form_stock_out
      render :new
    end
  end

  def update
    if @stock_out.update(stock_out_params)
      redirect_to @stock_out, notice: "Saida do Estoque alterado com sucesso !!! "
    else
      prepare_form_stock_out
      render :edit
    end
  end

  def destroy
    @stock_out.destroy
    redirect_to stock_eouts_url, notice: "Saida do Estoque excluido com sucesso"
  end

  private

  def set_stock_out
    @stock_out = StockOut.find(params[:id])
  end

  def stock_out_params
    params.require(:stock_out).permit(:id, :order_number, :client_id, :quantity, :date_out, :description, :stock_id)
  end

  def prepare_form_stock_out
    @stocks = Stock.all.map { |stock| [stock.product.supplier.supplier_name + " " + stock.product.reference + " " + 
      stock.product.description + " " + stock.product.product_color.description + " " +
      stock.product.product_composition.description + " " + stock.product.product_size.description, 
      stock.quantity, stock.id] }

    @clients = Client.all.map {|client| [client.client_name , client.id]}
  end
  
end

