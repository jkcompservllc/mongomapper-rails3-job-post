class JobsController < ApplicationController
  before_filter :need_employers
  before_filter :fetch_job_from_url, :only => [:edit, :update, :destroy]
  
  def new
    @job = flash[:job] || Job.new
  end
  
  def edit
    @job = flash[:job] || @job
  end
  
  def index
    @jobs = Job.all
  end
  
  def create
    @job = Job.new(params[:job])
    
    if @job.save
      redirect_to jobs_url
    else
      flash[:job] = @job
      redirect_to new_job_url
    end
  end
  
  def destroy
    @job.destroy
    redirect_to jobs_url
  end
  
  def update
    if @job.update_attributes(params[:job])
      redirect_to jobs_url
    else
      flash[:job] = @job
      redirect_to edit_job_url(@job)
    end
  end
  
  private
  def need_employers
    if Employer.count == 0
      flash[:notice] = "Add some employers first"
      redirect_to new_employer_url
    end
  end
    
  def fetch_job_from_url
    @job = Job.find(params[:id])
  end
end
