class TasksController < ApplicationController
  def new
    puts "create action...may be"
  end

  def create
    render plain: params[:task].inspect
  end
end
