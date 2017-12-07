require 'json'

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_wedding


  def index
    @tasks = Task.where('wedding_id = ?', @wedding.id)
  end


  def show
    @details = parsing_json
  end


  def new
    @task = Task.new
    @details = parsing_json

  end

  def create
    @task = Task.new(task_params)
    @details = parsing_json
    @task.wedding_id = @wedding.id
    @task.details = @details[@task.name]
    if @task.save
      redirect_to wedding_task_path(@wedding, @task)
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

  def parsing_json
    file = File.read "app/models/tasks.json"
    datas = JSON.parse(file)
    return datas
  end

end
