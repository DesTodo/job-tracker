class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def show
  end

  def create
    @job = Job.create(params[:job_id])
    @comment = @job.comments.create(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
