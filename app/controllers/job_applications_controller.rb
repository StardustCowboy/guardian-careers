class JobApplicationsController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_job_application, only: [:show, :edit, :update, :destroy]
  #before_action :account_required
  
  
  #before_action :job_requirements, only: [:new]
  #before_action :remote_application
  respond_to :html

  def index
    @job_applications = JobApplication.all
    if params[:job_id]
      @job_applications = JobApplication.where(:job_id => params[:job_id])
    end
    respond_with(@job_applications)
  end

  def show
    respond_with(@job_application)
  end

  def new
    
      @job_application = JobApplication.new(:job_id => params[:job_id])
      respond_with(@job_application)
   
  end

  def edit
  end

  def create
    @job_application = JobApplication.new(job_application_params)
    @job_application.save
    respond_with(@job_application)
  end

  def update
    @job_application.update(job_application_params)
    respond_with(@job_application)
  end

  def destroy
    @job_application.destroy
    respond_with(@job_application)
  end

  private
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    def job_application_params
      
      params.require(:job_application).permit(:cover_letter, :user_id, :job_id, :account_id, :license)
    end
   

    def job_requirements
      job= Job.find(params[:job_id])

      if job.transcript
        unless current_user.account.transcript.present?
          redirect_to (jobs_path)
          flash[:notice] = "you need to upload your transcript to apply"
           
        end 
      end

       

       #if job.gpa
        #unless current_user.account.gpa.present?
         # redirect_to (jobs_path)
          #flash[:notice] = "you need to submit your gpa to apply"
           
        #end 
      #end
    end

    def account_required
      if !current_user.account.present?
        redirect_to (jobs_path)
        flash[:notice] = "you need to create your account"
        
      end     
    end

    def remote_application
      if Job.find(params[:job_id]).link.blank
        redirect_to Job.find(params[:job_id]).link
      end
    end
end
