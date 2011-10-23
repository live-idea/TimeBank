class JobsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index,:show]
  def index
    @jobs = Job.all
    
  end

  def show
   
      @job = Job.find params[:id]
      @comment = Comment.new
      @candidate = Candidate.find_by_user_id_and_job_id(current_user.id,@job.id)
  
    end

    def new
      @job = Job.new
    end

    def create
      @job = current_user.jobs.new params[:job]
      if @job.save
        flash[:notice] = 'Job created'
        redirect_to @job
      else
        render :new 
      end 
    end

    def edit 
      if (current_user.id == @job.user_id)
        @job = Job.find params[:id]
      else
        flash[:notice] = 'You are not owner!'
      end
    end

    def update
      @job = Job.find params[:id]
      if @job.update_attributes(params[:job])
        flash[:notice] = 'Job updated'
        redirect_to @job
      else
        render :edit
      end
    end

    def destroy
      @job = Job.find params[:id]
      if (current_user.id == @job.user_id)
        @job.destroy
        redirect_to @job
      else
        flash.now[:notice] = 'You are not owner!'
        render :show
      end
    end

 
  def ajax
    render :text => "Thanks"
  end


  def done
    @job = Job.find params[:id]
    @candidate = @job.worker
    @user_owner = @job.user
    @user_worker = @candidate.user
    @user_owner.bill -= @job.cost
    @user_worker.bill += @job.cost
    @job.status = "finished"
    @job.save
    @user_worker.save
    @user_owner.save
    redirect_to jobs_path
  end

  
end



