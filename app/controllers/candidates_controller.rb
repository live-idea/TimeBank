class CandidatesController < ApplicationController
  def index
    @candidates = Job.find(params[:job_id]).candidates
  end

  def show
    @candidate = Candidate.find(params[:id])
    @job = Job.find(params[:job_id])
    @comment = @job.comments.new params[:comment]
  end

  def new
    @job = Job.find(params[:job_id])
    @candidate = @job.candidates.new
    
    
  end

  def create
    
    @job = Job.find(params[:job_id])
    @candidate = @job.candidates.new
    @candidate.user_id = current_user.id
    if @candidate.save
      flash[:notice] = 'Candidate created'
      redirect_to job_candidate_url(@job, @candidate)
    else
      render :new
    end
    
  end

  def edit
    @candidate = Candidate.find(params[:id])
  end

  def update
    @candidate = Candidate.find(params[:id])
    if @candidate.update_attributes(params[:candidates])
      flash[:notice] = 'Candidate updated'
      redirect_to @candidate
    else
      render :edit
    end
  end
  

  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy
    redirect_to Candidate
  end

end
