class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show()end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params_task)
    @task.save

    redirect_to tasks_path(@tasks)
  end

  def edit()end

  def update
    @task.update(params_task)

    redirect_to tasks_path(@tasks)
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end


  private
  def params_task
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
