# frozen_string_literal: true

class Api::AccountsController < Api::BaseController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index]

  respond_to :json

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
    render :index
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    # present Accounts::Show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    respond Accounts::Create, location: nil
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond Accounts::Update, location: nil
    # respond_to do |format|
    #   if @account.update(account_params)
    #     format.html { redirect_to @account, notice: 'Account was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @account }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @account.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def register_device
    respond Accounts::Devices::RegisterDevice, location: nil
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    if @account
      @account.destroy
      head :no_content
    else
      head :not_found
    end
  end

  # DELETE /accounts/1/delete_orders
  def delete_orders
    respond Accounts::DeleteOrders, location: nil
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, :phone, :email, :addresses)
    end
end
