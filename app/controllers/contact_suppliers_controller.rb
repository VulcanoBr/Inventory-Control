class ContactSuppliersController < ApplicationController
 
  before_action :get_contact_supplier
  before_action :set_contact_supplier, only: [:show]

  def index
    @contact_suppliers = ContactSupplier.all
  end

  def show
    
  end

  private

  def set_contact_supplier
      @contact_supplier = Supplier.find(params[:id])
  end

  def get_contact_supplier
    if params[:id]
      @contact_suppliers = ContactSupplier.where(:supplier_id => params[:id])
    else
      @contact_suppliers = ContactSupplier.all
    end
  end

  def contact_params
    params.require(:contact_supplier).permit(:id, :supplier_name, :email, :telephone, :cell_phone, :description, :supplier_id)
  end
end
