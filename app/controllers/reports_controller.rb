class ReportsController < ApplicationController

  include Paginable

  def index
    prepare_pesq_product_type
  end

  def report
    if params[:q].blank?
      redirect_to reports_path, notice: "Não foi selecionado nenhum tipo !!! "
    else
      @results = Stock.pesq_prod(params[:q])
      if @results.length < 1
        redirect_to reports_path, notice: "Não ha produtos no Estoque, para o tipo selecionado !!! "
      end
    end
  end

  def withoutstock
    @products_whithout_stock = Product.without_stock 
  end

  private 

  def prepare_pesq_product_type
    @product_types = ProductType.order(:description).all.map { |type| [type.description, type.id] }
  end

  

end
