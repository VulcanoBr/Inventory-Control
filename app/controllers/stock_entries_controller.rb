class StockEntriesController < ApplicationController

  before_action :get_stock_entry, only: [:show, :edit, :update, :destroy]
  before_action :prepare_form_type_entry
  before_action :get_stock  #, only: [:creat, :new, :edit]
 
  def index
    #prepare_form_supplier

    @stock_entries = StockEntry.all
    
  end

  def show
    
  end

  def new
    prepare_form_type_entry
    @stock_entry = StockEntry.new
    
    #get_stock
  
  end


  def edit
    #prepare_form_stock_entry
  end

  def create
   
    @stock_entry = StockEntry.new(stock_entry_params) 
    
    if @stock_entry.save
      redirect_to @stock_entry, notice: "Entrada no Estoque criado com sucesso !!! "
    else 

     # get_stock
      
      render  :new
      
    end
  end


  def update
    if @stock_entry.update(stock_entry_params)
      redirect_to @stock_entry, notice: "Entrada no Estoque alterado com sucesso !!! "
    else
     
      render :edit
    end
  end

  def destroy
    @stock_entry.destroy
    redirect_to stock_entries_url, notice: "Entrada no Estoque excluido com sucesso"
  end

  private

  def get_stock_entry
    @stock_entry = StockEntry.find(params[:id])
    prepare_form_type_entry
    params[:entry_cod] = @stock_entry.stock_id
    get_stock
  end

  def get_stock
    stock_list = Stock.all
    stock_list.where!(product_id: params[:entry_cod])  if params[:entry_cod]    
      @stockprod = stock_list.map do |stock|
        description = [
          stock.product.supplier.supplier_name,
          stock.product.product_type.description,
          stock.product.description,
          stock.product.product_color.description,
          stock.product.product_composition.description,
          stock.product.product_size.description
        ].join(", ")      
        [description, stock.id]
      end
    
  end

 

  def stock_entry_params
    params.require(:stock_entry).permit(:id, :date_invoice, :invoice, :quantity, :unit_price, :date_entry, :description, :stock_id, :type_entry, :q, :product_id, :entry_cod)
  end
  
  def prepare_form_supplier
    @sesuppliers = Supplier.order(:supplier_name).all.map { |supplier| [supplier.supplier_name, supplier.id] }
    
  end

  def prepare_form_type_entry
    @typeentries = [["Material de Fornecedor", 0], ["Retorno para Estoque", 1], ["Devolução de Cliente", 2], ["Material Fabricado", 3]]
  end

  
end
