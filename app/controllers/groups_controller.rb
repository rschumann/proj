class GroupsController < ApplicationController
  before_filter :find_group, :only => [:show, :edit, :update, :destroy]
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @comments = Group.find(params[:id]).comments

    @tasks = []
    find_group.orders.each do |f|
      @tasks << f.task
    end
    @tasks

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @tasks = Task.where(group_id:[@group, nil])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    #raise params.inspect
    @tasks = Task.find_all_by_id(params[:tasks_ids])
    @group.tasks = @tasks

    Order.destroy_all(:group_id => @group.id )

    @tasks.each do |task|
      Order.create(:group_id => @group.id, :task_id => task.id)
    end

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  private

  def find_group
    @group = Group.find(params[:id])
  end


end
