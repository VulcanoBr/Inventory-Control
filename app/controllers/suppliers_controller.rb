class SuppliersController < ApplicationController

  include Paginable

  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  def index
    if search_params[:q].blank?
      @suppliers = Supplier.sorted_supplier.page(current_page).per(per_page)
    else  
      @suppliers = Supplier.search(search_params[:q]).page(current_page).per(per_page)
    end
  end

  def show
  end

  def new
    @supplier = Supplier.new
  end

  def edit
  end


  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      redirect_to @supplier, notice: "Fornecedor Cadastrado com sucesso !!!"
    else
      render :new
    end
  end

  
  def update
    if @supplier.update(supplier_params)
      redirect_to @supplier, notice: "Fornecedor Atualizado com Sucesso !!!"
    else
      render :edit
    end
  end

  def destroy
    @supplier.destroy
    redirect_to  suppliers_path, notice: "Fornecedor Excluido com sucesso !!!"
  end

  private

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  def search_params
    params.permit(:q)
  end

  def supplier_params
    params.required(:supplier).permit(:supplier_name, :identification, :description, :search,
      address_suppliers_attributes: [:id, :street, :number, :complement, :neighborhood, :city, :state, :zip_code, :supplier_id, :_destroy],
      contact_suppliers_attributes: [:id, :supplier_name, :email, :telephone, :cell_phone, :description, :supplier_id, :_destroy])
  end

end
