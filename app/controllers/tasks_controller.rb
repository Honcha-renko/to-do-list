class TasksController < ApplicationController

  def index

  end

  def show
    @task = Task.find(params[:id])
    #render json: Task.all
  end

  def new
    puts 'create action...may be'
  end

  def edit

  end

  def create
    render plain: params[:task].inspect
    params.permit!
    @task = Task.new(params)
    @task.save
    redirect_to @task
  end

  def update

  end

  def destroy

  end

  private

  def params
    params.require(:task).permit(:title, :text, :tag, :done, :expire_on)
  end
end
