# frozen_string_literal: true

class Api::AddressesController < Api::BaseController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index]

  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = Address.all
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    respond Accounts::Addresses::Create, location: nil
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond Accounts::Addresses::Update
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    run Accounts::Addresses::Destroy, params
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:title, :city, :street, :house, :office, :entrance, :floor, :code)
    end
end
