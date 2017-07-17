class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    #@categories = Category.all
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    #@categories = Category.all
    #@category = Category.find(params[:category_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @company = Company.find(params[:company_id])
    #@job = @company.jobs.build
    @job = Job.find(params[:id])

    # @post = Post.find params[:post_id]
    # @comment = Comment.new(:post=>@post)
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)

    redirect_to company_jobs_path
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    flash[:success] = "#{@job.title} was successfully deleted!"
    redirect_to company_jobs_path(params[:company_id])
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
