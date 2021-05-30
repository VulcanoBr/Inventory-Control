class AddressSuppliersController < ApplicationController
 
  before_action :get_address_supplier
  before_action :set_address_supplier, only: [:show]

  def index
    @address_suppliers = AddressSupplier.all
  end

  def show
  end

  private

  def set_address_supplier
      @address_supplier = Supplier.find(params[:id])
  end

  def get_address_supplier
    if params[:id]
      @address_suppliers = AddressSupplier.where(:supplier_id => params[:id])
    else
      @address_suppliers = AddressSupplier.all
    end
  end

  def addresses_params
    params.require(:address_supplier).permit(:id, :streeet, :number, :complement, :neighbordhood, :city, :state, :zip_code, :supplier_id)
  end
end
