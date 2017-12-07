class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_wedding


  def index
    @tasks = Task.where('wedding_id = ?', @wedding.id)
  end


  def show
  end


  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.wedding_id = @wedding.id
    if @task.save
      redirect_to wedding_path(@wedding)
    else
      render :new
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end

  def task_params
    params.require(:task).permit(:name)
  end


end
