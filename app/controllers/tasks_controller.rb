class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to @task
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    Task.find(params[:id]).destroy
     redirect_back(fallback_location: root_path)
  end

  private

  def task_params
    params['task']['tag'] = params['task']['tag'].to_i
    params.require(:task).permit(:title, :text, :tag, :done, :expire_on)
  end
end
