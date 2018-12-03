class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show update destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
    paginate json: @companies
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @companies = Company.find(params[:id])
    @companies.punch(request)
    company_info = @companies.attributes
    company_info[:count] = @companies.hits
    render json: company_info
  end

  def top_five
    @companies = Company.most_hit
    aux = []
    @companies.each do |company|
      company_info = company.attributes
      company_info[:count] = company.hits
      aux << company_info
    end
    render json: aux
  end

  #GET distinct cities /companies/cities
  def cities
    @companies = Company.distinct.pluck(:city)
    render json: @companies
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    if @company.save
      @company.path_image
      message = {'status' => 'Created new Company.'}
      render json: message
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    if @company.update(company_params)
      message = {'status' => 'Saved successfully.'}
      render json: message
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def company_params
    params.require(:company).permit(:name, :contact, :address, :city, :postalCode, :path_image, :long, :lat)
  end
end
