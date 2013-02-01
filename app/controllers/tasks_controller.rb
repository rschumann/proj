class TasksController < ApplicationController

  before_filter :find_task, :only => [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
    @comments = Comment.all
  end

  def show
    @comments = @task.comments
    @user_title = @task.user.title if @task.user
    @group_title = @task.group.title if @task.group

    respond_to do |format|
      format.html { render :comments, layout: request.xhr?.nil? } # index2.html.erb
      format.js
    end
  end

  def new
    @task = Task.new
  end

  def create
    new_order = lambda {|g,t,u| Order.create(:group_id => g, :task_id => t, :user_id => u)}
    @task = Task.new(params[:task])

    respond_to do |format|
    if @task.save
      if (@task.group_id && @task.user_id)
        new_order.call(@task.group_id, @task.id, nil)
        new_order.call(nil, @task.id, @task.user_id)
      elsif  @task.group_id
        new_order.call(@task.group_id, @task.id, nil)
      elsif @task.user_id
        new_order.call(nil, @task.id, @task.user_id)
      end
      format.html { redirect_to @task, notice: 'Task was successfully created.' }
      format.json { render json: @task, status: :created, location: @task }
    else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
    end
  end

  end

  def update
    respond_to do |format|
      if @task.update_attributes(params[:task])

        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js
    end
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end
end
