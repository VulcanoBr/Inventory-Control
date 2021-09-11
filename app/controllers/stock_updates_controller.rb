class StockUpdatesController < ApplicationController

  def index
    prepare_pesq_supplier
  end

  def search
    if params[:q].blank?
      redirect_to stock_updates_path, notice: "Não ha fornecedor selecionado !!! "
    else
      @results = Stock.find_update(params[:q])
      if @results.length < 1
        redirect_to stock_updates_path, notice: "Não ha produtos cadastrados, para o fornecedor selecionado !!! "
      end
    end
  end

  private 

  def prepare_pesq_supplier
    @sesuppliers = Supplier.order(:supplier_name).all.map { |supplier| [supplier.supplier_name, supplier.id] }
  end

  
  
end
