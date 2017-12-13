require 'json'

class TasksController< ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_wedding


  def index
    @tasks = Task.where('wedding_id = ?', @wedding.id)
  end


  def show
    @private_elements = @task.elements.where('public = ?', false)
    @public_elements = @task.elements.where('public = ?', true)
    @element = Element.new

    @messages = @task.messages.all
    @messages.update_all(read: true) if @task.wedding.user == current_user

    @message = Message.new
  end


  def new
    @tasks = @wedding.tasks
    @tasks_name_list = parsing_json.keys
    @tasks_existing_names_list = @tasks.pluck(:name)
    @tasks_filtered_names_list = @tasks_name_list.select { |taskname|  !@tasks_existing_names_list.include?(taskname) }
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.wedding_id = @wedding.id
    @task.statut = false
    if @task.save
      redirect_to wedding_task_path(@wedding, @task)
    else
      render :new
    end
  end

  def edit
    @task.update(statut: !@task.statut)
    redirect_to wedding_task_path(@wedding, @task)
  end

  def update
  end

  def destroy
    redirect_to wedding_path(@wedding)
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
