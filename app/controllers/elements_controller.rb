class ElementsController < ApplicationController
before_action :set_wedding
before_action :set_task
before_action :set_category
before_action :set_element, only: [:show, :edit, :upate, :destroy]

  def index
    @elements = Element.where('wedding_id = ? AND task_id = ? AND category_id = ?', @wedding.id, @task.id, @category.id)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end




private

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_category
    @category = Catgeory.find(params[:category_id])
  end

  def set_element
    @element = Element.find(params[:id])
  end

end
