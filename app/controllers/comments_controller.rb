class CommentsController < ApplicationController
 before_filter :authenticate_user!
  def index
    @comments = Comment.all
    @job = Job.find(params[:job_id])
    @comment = @job.comments.new
    user_id = params[:user_id]
    if !user_id
      user_id = current_user.id
    end
    @user = User.find(user_id)
  end

  def show
    @comment = Comment.find params[:id]
  end

  def new
    @comment = Comment.new
  end

  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.new params[:comment]
    @comment.user = current_user
    if params[:public_comment]
        @comment.public = true
      else @comment.public = false
    end
      if @comment.save
      flash[:notice] = 'Comment created'
      redirect_to @job
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find params[:id]
        
  end

  def destroy
    @comment = Comment.find params[:id]
    @job = @comment.job
    @comment.destroy
    redirect_to  @job   
  end

end
