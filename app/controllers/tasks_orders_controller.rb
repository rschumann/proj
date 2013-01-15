class TasksOrdersController < ApplicationController

  def index
    tasks = params[:tasks]
    orders = Group.find(params[:group_id]).orders
    orders.each_with_index do |g, i|
      g.update_attributes(:task_id => tasks[i])
    end

    render :nothing => true
  end


end
