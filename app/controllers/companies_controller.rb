class CompaniesController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  def new
    @company = Company.new
  end
  
  def index
    @companies = Company.all
  end
  
  def create
    Company.create(companies_params(current_user))
    redirect_to :personal_user_path
  end
  
  def show
    company = Company.find_by(:slug => params[:id])
    @companyPresenter = Companies::ShowPresenter.new(company)
  end
  
  def search
    @companies = Company.like_name(params[:pattern])
  end
  
  private
  def companies_params(user)
    params
    .require(:company)
    .permit(:name, :url, :address, :category)
    .merge(user: user)
  end
  
end