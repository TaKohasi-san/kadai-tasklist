class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.order(created_at: :desc).page(params[:page]).per(3)
    # if logged_in?
    #   @user = current_user
    #   @tasks= current_user.tasks.order('created_at DESC').page(params[:page])
    # end
  end
  
  def show
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'Task が正常に登録されました'
      redirect_to @task
      
    else
      flash.now[:danger] = 'Task が登録されませんでした'
      render :new
    end
    
  end
  
  def edit
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
      
    else
      flash.now[:danger] = 'Task　は更新されませんでした'
      render :edit
    end
    
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasks_url
  end

  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end

end
