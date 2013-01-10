class GroupTasksOrdersController < ApplicationController
  # GET /group_tasks_orders
  # GET /group_tasks_orders.json
  def index
    @group_tasks_orders = GroupTasksOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @group_tasks_orders }
    end
  end

  # GET /group_tasks_orders/1
  # GET /group_tasks_orders/1.json
  def show
    @group_tasks_order = GroupTasksOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group_tasks_order }
    end
  end

  # GET /group_tasks_orders/new
  # GET /group_tasks_orders/new.json
  def new
    @group_tasks_order = GroupTasksOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group_tasks_order }
    end
  end

  # GET /group_tasks_orders/1/edit
  def edit
    @group_tasks_order = GroupTasksOrder.find(params[:id])
  end

  # POST /group_tasks_orders
  # POST /group_tasks_orders.json
  def create
    @group_tasks_order = GroupTasksOrder.new(params[:group_tasks_order])

    respond_to do |format|
      if @group_tasks_order.save
        format.html { redirect_to @group_tasks_order, notice: 'Group tasks order was successfully created.' }
        format.json { render json: @group_tasks_order, status: :created, location: @group_tasks_order }
      else
        format.html { render action: "new" }
        format.json { render json: @group_tasks_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /group_tasks_orders/1
  # PUT /group_tasks_orders/1.json
  def update
    @group_tasks_order = GroupTasksOrder.find(params[:id])

    respond_to do |format|
      if @group_tasks_order.update_attributes(params[:group_tasks_order])
        format.html { redirect_to @group_tasks_order, notice: 'Group tasks order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group_tasks_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_tasks_orders/1
  # DELETE /group_tasks_orders/1.json
  def destroy
    @group_tasks_order = GroupTasksOrder.find(params[:id])
    @group_tasks_order.destroy

    respond_to do |format|
      format.html { redirect_to group_tasks_orders_url }
      format.json { head :no_content }
    end
  end
end
