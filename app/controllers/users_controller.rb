class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    @tasks = []
    @user.orders.each do |f|
      @tasks << f.task
    end
    @tasks



    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @tasks = Task.where(user_id:[@user, nil])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.save

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update

    @user = User.find(params[:id])
    @tasks = Task.find_all_by_id(params[:tasks_ids])
    @user.tasks = @tasks

    Order.destroy_all(:user_id => @user.id )

    @tasks.each do |task|
      Order.create(:user_id => @user.id, :task_id => task.id)
    end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def delete_asset
    @user = User.find(params[:user_id])
    asset = @user.attached_assets.find(params[:id])
    asset.asset.clear
    asset.destroy
    @user.save
    redirect_to :back
  end
end
