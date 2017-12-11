require 'json'

class TasksController< ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_wedding


  def index
    @tasks = Task.where('wedding_id = ?', @wedding.id)
  end


  def show
  end


  def new
    @task = Task.new
    @tasks_name_list = parsing_json.keys
  end

  def create
    @task = Task.new(task_params)
    @task.wedding_id = @wedding.id

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
    file = File.read("#{Rails.root}/lib/tasks_details/details.json")
    categories_details = JSON.parse(file)
    return categories_details
  end

end
