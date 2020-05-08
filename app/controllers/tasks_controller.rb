# frozen_string_literal: true

# class with CRUD operations
class TasksController < ApplicationController
  # @sorting = [true,false]
  def index
    @tasks = Task.order(tag: :asc)
  end

  def show
    if Task.exists?(params[:id])
      Task.find(params[:id])
    else
      redirect_to tasks_path, message: "User with #{params[:id]} id doesn\'t exist"
    end
  end

  def create
    @task = Task.create(task_params)
    redirect_to @task
  end

  # before_action :callback, on: %i[update delete]
  def update
    if Task.exists?(params[:id])
      # @task = Task.find(params[:id])
      redirect_to @task if @task.update(task_params)
    else
      redirect_to tasks_path, message: "User with #{params[:id]} id doesn\'t exist"
    end
  end

  def destroy
    if Task.exists?(params[:id])
      @task = Task.find(params[:id]).destroy
      redirect_back(fallback_location: tasks_path)
    else
      redirect_to tasks_path, message: "User with #{params[:id]} id doesn\'t exist"
    end
  end

  private

  # def callback
  #   @task = Task.find(params[:id])
  # end

  def task_params
    params['task']['tag'] = params['task']['tag'].to_i
    params.require(:task).permit(:title, :text, :tag, :done, :expire_on)
  end
end
