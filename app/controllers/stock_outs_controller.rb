class StockOutsController < ApplicationController

  include Paginable

  before_action :set_stock_out, only: [:show, :edit, :update, :destroy]
  before_action :prepare_form_type_out

  def index
    @stock_outs = StockOut.order(date_out: :desc).page(current_page).per(per_page)
  end

  def show
  end

  def new
    prepare_form_stock_out
    @stock_out = StockOut.new
    get_stock
  end

  def edit
    prepare_form_stock_out
  end

  def create
    qtd1 = @qtd.to_i
    @stock_out = StockOut.new(stock_out_params) 
    
    if @stock_out.save
      redirect_to @stock_out, notice: "Saida do Estoque criado com sucesso !!! "
    else
      prepare_form_stock_out
      params[:stock_cod] = @stock_out.stock_id
      get_stock
      render  :new
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
    redirect_to stock_outs_url, notice: "Saida do Estoque excluido com sucesso"
  end

  
  private

  def set_stock_out
    @stock_out = StockOut.find(params[:id])
    prepare_form_type_out
    params[:stock_cod] = @stock_out.stock_id
    @stocks = Stock.where(id: params[:out_cod])
    get_stock 
  end

  def get_stock 
    stock_list = Stock.where(id: params[:out_cod])  if params[:out_cod] 
    stock_list = Stock.where(id: params[:stock_cod])  if params[:stock_cod]   
    stock_list = Stock.all  if stock_list.blank?

    @stockprod = stock_list.map do |stock|
        @qtd = stock.quantity
        description = [
            stock.supplier.supplier_name,
            stock.product.product_type.description,
            stock.product.description,
            stock.product.product_color.description,
            stock.product.product_composition.description,
            stock.product.product_size.description
            ].join(", ")     
        [description, stock.quantity, stock.id ]
    end
  end 

  def stock_out_params
    params.require(:stock_out).permit(:id, :order_number, :client_id, :quantity, :date_out, :description, :stock_id, :type_out, :product_id, :out_cod, :q)
  end

  def prepare_form_stock_out
      @clients = Client.all.map {|client| [client.client_name , client.id]}
  end

  def prepare_form_type_out
    @typeouts = [["Material para Fabricação", 0], ["Devolução para Fornecedor", 1], ["Devolução Estoque para Fornecedor", 2], ["Material para Cliente", 3]]
  end
  
end

