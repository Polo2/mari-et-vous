class MessagesController < ApplicationController

before_action :set_wedding
before_action :set_task
before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end


  def new
  end


  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.task = @task
    if @message.save
      redirect_to wedding_task_path(@wedding, @task)
    end
  end


  def destroy
    @message.destroy
    redirect_to message_path
  end

private


  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:title, :content)
  end

end
