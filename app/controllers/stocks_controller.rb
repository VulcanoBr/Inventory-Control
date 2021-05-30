class StocksController < ApplicationController

  include Paginable

  before_action :set_stock, only: [:show, :update, :destroy]
  before_action :prepare_supplier

  def index
    @stocks = Stock.all.page(current_page).per(per_page)
  end

  def show
    prepare_form_stock
  end

  def new
    prepare_form_stock
    @stock = Stock.new
  end

  def edit
    if params[:prod_id]
      @stock = Stock.find_by(id: params[:prod_id])
      params[:prod_id] = @stock.product_id
    else  
      set_stock
  end
    prepare_form_stock
  
  end

  def create
    @stock = Stock.new(stock_params) 
    if @stock.save
      redirect_to @stock, notice: "Estoque criado com sucesso !!! "
    else
      params[:prod_id] = @stock.product_id
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
    params[:prod_id] = @stock.product_id
    prepare_form_stock
  end

  def stock_params
    params.require(:stock).permit(:id, :product_id, :minimum_quantity, :quantity, 
                    :last_unit_price, :description, :reference, :prod_id, :supplier_id, :ajust_cod)
  end

  def prepare_form_stock
    product_list = Product.all
    product_list.where!(id: params[:prod_id])  if params[:prod_id]
    @products = product_list.map do |prod| 
      description = [
        prod.product_type.description,
        prod.description, prod.product_color.description,
        prod.product_composition.description, prod.product_size.description 
      ].join(", ")      
      [description, prod.id] 
    end
  end

  def prepare_supplier
    @sesuppliers = Supplier.order(:supplier_name).all.map { |supplier| [supplier.supplier_name, supplier.id] }
  end

end
