# frozen_string_literal: true

# class with CRUD operations
class TasksController < ApplicationController
  before_action :find_task, only: %i[show edit destroy]

  def index
    @tasks = Task.order(tag: :asc)
  end

  def new; end

  def show; end

  def create
    @task = Task.create(task_params)
    binding.pry
    redirect_to @task
  end

  def update
    @task.update(oth_params)
    redirect_to @task
  end

  def destroy
    @task.destroy
    redirect_back(fallback_location: tasks_path)
  end

  private

  def find_task
    @task = Task.find(params[:id])
    redirect_to tasks_path, message: "User with #{params[:id]} id doesn\'t exist" unless Task.exists?(params[:id])
  end

  def task_params
    params['task']['tag'] = params['task']['tag'].to_i
    params.require(:task).permit(:title, :text, :tag, :done, :expire_on)
  end

  def oth_params
    params.permit(:title, :text, :tag, :done, :expire_on)
  end
end
