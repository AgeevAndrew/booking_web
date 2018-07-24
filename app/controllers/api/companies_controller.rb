# frozen_string_literal: true

class CompaniesController < BaseController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :delivery_time_change]

  # GET /company
  # GET /company.json
  def index
    @companies = Company.all
  end

  # GET /company/1
  # GET /company/1.json
  def show
    if @company.present?
      render json: Api::CompanyRepresenter.represent(@company)
    else
      render json: {}, status: :not_found
    end
  end

  # GET /company/new
  def new
    @company = Company.new
  end

  # GET /company/1/edit
  def edit
  end

  # POST /company
  # POST /company.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company/1
  # PATCH/PUT /company/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company/1
  # DELETE /company/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delivery_time_change
    respond Companies::DeliveryTimeChange, location: nil
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :categories, :description, :contact_info)
    end
end
