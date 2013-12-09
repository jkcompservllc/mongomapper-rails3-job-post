class EmployersController < ApplicationController
  before_filter :fetch_employer_from_url, :only => [:edit, :update]
  
  def new
    @employer = flash[:employer] || Employer.new
  end
  
  def edit
    @employer = flash[:employer] || @employer
  end
  
  def index
    @employers = Employer.all
  end
  
  def create
    @employer = Employer.new(params[:employer])
    
    if @employer.save
      redirect_to employers_url
    else
      flash[:employer] = @employer
      redirect_to new_employer_url
    end
  end
  
  def update
    if @employer.update_attributes(params[:employer])
      redirect_to employers_url
    else
      flash[:employer] = @employer
      redirect_to edit_employer_url(@employer)
    end
  end
  
  private
    
  def fetch_employer_from_url
    @employer = Employer.find(params[:id])
  end
end
