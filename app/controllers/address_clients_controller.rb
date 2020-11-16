class AddressClientsController < ApplicationController
 
  before_action :get_address_client
  before_action :set_address_client, only: [:show]

  def index
    @address_clients = AddressClient.all
  end

  def show
    
  end

  private

  def set_address_client
      @address_client = Client.find(params[:id])
  end

  def get_address_client
    if params[:id]
      @address_clients = AddressClient.where(:client_id => params[:id])
    else
      @address_clients = AddressClient.all
    end
  end

  def addresses_params
    params.require(:address_client).permit(:id, :streeet, :number, :complement, :neighbordhood, :city, :state, :zip_code, :client_id)
  end
end
