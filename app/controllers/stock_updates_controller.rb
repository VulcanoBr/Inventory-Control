class StockUpdatesController < ApplicationController

  # before_action :get_stock_entry, only: [:new]

  def index
    prepare_pesq_supplier
  end

  def search
    if params[:q].blank?
      redirect_to stock_updates_path, notice: "Não ha fornecedor selecionado !!! "
    end
      @results = Product.where(supplier_id: params[:q])
  end

  private 

  def prepare_pesq_supplier
    @sesuppliers = Supplier.order(:supplier_name).all.map { |supplier| [supplier.supplier_name, supplier.id] }
  end

  
  
end
