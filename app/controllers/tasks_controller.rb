class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    @comments = Comment.all



    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
    @comments = Task.find(params[:id]).comments
    if User.find_by_id(@task.user_id)
      @user_title = User.find_by_id(@task.user_id).title
    end
    if Group.find_by_id(@task.group_id)
      @group_title = Group.find_by_id(@task.group_id).title
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
    #@user = User.select(:title)
    #raise User.select(:title).inspect

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
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

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])



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

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
end
