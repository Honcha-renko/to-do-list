class TasksController < ApplicationController
#  @sorting = [true,false]
  def index
    @tasks = Task.order(tag: :asc)
  end

  def new
  end

  def show
    if Task.find_by(id: params[:id]).nil?
      redirect_to tasks_path, message: "User with #{params[:id]} id doesn\'t exist"
      return
    end
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.create(task_params)
    redirect_to @task
  end

  def update
    if Task.find_by(id: params[:id]).nil?
      redirect_to tasks_path, message: "User with #{params[:id]} id doesn\'t exist"
      return
    end

    @task = Task.find(params[:id])
    redirect_to @task if @task.update(task_params)
  end

  def destroy
    if Task.find_by(id: params[:id]).nil?
      redirect_to tasks_path, message: "User with #{params[:id]} id doesn\'t exist"
      return
    end

    Task.find(params[:id]).destroy
    redirect_back(fallback_location: tasks_path)
  end

  private

  def task_params
    params['task']['tag'] = params['task']['tag'].to_i
    params.require(:task).permit(:title, :text, :tag, :done, :expire_on)
  end
end
