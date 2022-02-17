class TasksController < ApplicationController
  before_action :authenticate_user!, only: %i[index new edit show update create destroy search complete incomplete]
  before_action :user_profile?
  before_action :find_task, only: %i[edit update show confirm_delete destroy delete_comment change_status]
  skip_before_action :verify_authenticity_token, only: %i[search]

  def index
    @tasks = Task.all
  end

  def show
    # @tasks = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    @task.user = current_user
    if @task.save
      flash[:notice] = 'Task Created!'
      redirect_to reports_path
    else
      flash[:notice] = 'Task Not Create!, insert Title and Description'
      render :new
    end
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def find_task
    @task = Task.find(params[:id])
  end

  def update
    # @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = 'Task Updated!'
      redirect_to reports_path
    else
      flash[:notice] = 'Task Not Updated!'
      render :edit
    end
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = 'Task Deleted!'
    redirect_to user_reports_path
  end

  def change_status
    # @task = Task.find(params[:id])
    status = @task.status == 'complete' ? 'incomplete' : 'complete'
    @task.update(status: status)
  end

  # def complete
  #  end

  # def incomplete
  # end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def sanitize_sql_like(string, escape_character = "\\")
    pattern = Regexp.union(escape_character, "%", "_")
    string.gsub(pattern) { |x| [escape_character, x].join }
  end
end
