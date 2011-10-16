class JobsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index,:show]
  def index
    @jobs = Job.all
    
  end

  def show
    @job = Job.find params[:id]
    @comment = Comment.new
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
        redirect_to @Job
      else
        flash.now[:notice] = 'You are not owner!'
        render :show
      end
  end
end
