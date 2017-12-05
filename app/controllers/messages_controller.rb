class MessagesController < ApplicationController


  def show
  end


  def new
    @task = Task.find(params[:task_id])
    @message = Message.new(sender: current_user, receiver: @task.user)
  end


  def create
  end


  def destroy
    @message.destroy
    redirect_to message_path
  end

private

  def set_task

  end


  def task_params
  end
end
