class ContactClientsController < ApplicationController
 
  before_action :get_contact_client
  before_action :set_contact_client, only: [:show]

  def index
    @contact_clients = ContactClient.all
  end

  def show
    
  end

  private

  def set_contact_client
      @contact_client = Client.find(params[:id])
  end

  def get_contact_client
    if params[:id]
      @contact_clients = ContactClient.where(:client_id => params[:id])
    else
      @contact_clients = ContactClient.all
    end
  end

  def contact_params
    params.require(:contact_client).permit(:id, :client_name, :email, :telephone, :cell_phone, :description, :client_id)
  end
end
