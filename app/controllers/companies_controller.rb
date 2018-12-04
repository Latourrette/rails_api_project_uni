class CompaniesController < ApplicationController
  #skip_before_action :authorize_request, only: %i[index show]
  before_action :set_company, only: %i[show update destroy]


  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
    paginate json: @companies
    #render json: Company.order(id: :asc).to_json(methods: %i[company_image_url]), status: :ok
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @companies = Company.find(params[:id])
    @companies.punch(request)
    render json: @companies
  end

  def top_five
    @companies = Company.most_hit
    render json: @companies
  end

  def search
    name = params[:name]
    city = params[:city]
    @companies = Company.where("name ILIKE ?", "%#{name}%").where("city ILIKE ?", "%#{city}%")
    render json: @companies
  end

  #GET distinct cities /companies/cities
  def cities
    @companies = Company.distinct.pluck(:city)
    render json: @companies
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.create!(company_params)
    if @company.save
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
    params.require(:company).permit(:name, :contact, :address, :city, :postalCode, :image, :long, :lat)
  end
end
