class ClientsController < ApplicationController

  include Paginable

  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.search(params[:search]).page(current_page).per(per_page)
  end

  def show
  end

  def new
    @client = Client.new
  end

  def edit
  end


  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client, notice: "Cliente Cadastrado com sucesso !!!"
    else
      render :new
    end
  end

  
  def update
    if @client.update(client_params)
      redirect_to @client, notice: "Cliente Atualizado com Sucesso !!!"
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to  clients_path, notice: "Cliente Excluido com sucesso !!!"
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.required(:client).permit(:id, :client_name, :identification, :description,
      address_clients_attributes: [:id, :street, :number, :complement, :neighborhood, :city, :state, :zip_code, :client_id, :_destroy],
      contact_clients_attributes: [:id, :client_name, :email, :telephone, :cell_phone, :description, :client_id, :_destroy])
  end

end


