class TasksOrdersController < ApplicationController

  def index
    tasks = params[:tasks]
    task_orders = Group.find(params[:group_id]).tasks_orders
    task_orders.each_with_index do |g, i|
      g.update_attributes(:task_id => tasks[i])
    end

    render :nothing => true
  end


end
