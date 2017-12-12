class ElementsController < ApplicationController
before_action :set_wedding
before_action :set_task
before_action :set_element, only: [:show, :edit, :update, :destroy]

  def index
    @elements = Element.where('wedding_id = ? AND task_id = ?', @wedding.id, @task.id)
  end

  def show
  end

  def new
  end

  def create
    @element = Element.new(element_params)
    @element.task = @task
    if @element.save
      redirect_to wedding_task_path(@wedding, @task)
    end
  end

  def edit
  end

  def update
    @element.update(element_params)
    @element.task = @task
    if @element.save
      redirect_to wedding_task_path(@wedding, @task)
    end
  end

  def destroy
    @element.destroy
    redirect_to wedding_task_path(@wedding, @task)
  end


private

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_element
    @element = Element.find(params[:id])
  end

  def element_params
    params.require(:element).permit(:content, :public)
  end

end
