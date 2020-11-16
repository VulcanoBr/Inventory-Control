class StockEntriesController < ApplicationController

  before_action :set_stock_entry, only: [:show, :edit, :update, :destroy]

  def index
    @stock_entries = StockEntry.all
  end

  def show
    prepare_form_stock_entry

  end

  def new
    prepare_form_stock_entry
    @stock_entry = StockEntry.new
  end

  def edit
    prepare_form_stock_entry
  end

  def create
    @stock_entry = StockEntry.new(stock_entry_params) 
    
    if @stock_entry.save
      redirect_to @stock_entry, notice: "Entrada no Estoque criado com sucesso !!! "
    else
      prepare_form_stock_entry
      render :new
    end
  end

  def update
    if @stock_entry.update(stock_entry_params)
      redirect_to @stock_entry, notice: "Entrada no Estoque alterado com sucesso !!! "
    else
      prepare_form_stock_entry
      render :edit
    end
  end

  def destroy
    @stock_entry.destroy
    redirect_to stock_entries_url, notice: "Entrada no Estoque excluido com sucesso"
  end

  private

  def set_stock_entry
    @stock_entry = StockEntry.find(params[:id])
  end

  def stock_entry_params
    params.require(:stock_entry).permit(:id, :date_invoice, :invoice, :quantity, :unit_price, :date_entry, :description, :stock_id)
  end

  def prepare_form_stock_entry
    @stocks = Stock.all.map { |stock| [stock.product.supplier.supplier_name + " " + stock.product.reference + " " + 
      stock.product.description + " " + stock.product.product_color.description + " " +
      stock.product.product_composition.description + " " + stock.product.product_size.description, 
      stock.quantity, stock.id] }
  end
  
end
