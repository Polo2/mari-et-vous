class CategoriesController < ApplicationController
before_action :set_wedding
before_action :set_task
before_action :set_category, only: [:show, :edit, :upate, :destroy]


  def index
    @categories = Category.where('wedding_id = ? AND task_id = ? ', @wedding.id, @task.id)
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
    @category = Category.find(params[:id])
  end
end
