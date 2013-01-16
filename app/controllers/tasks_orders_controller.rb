class TasksOrdersController < ApplicationController

  def index
    tasks = params[:tasks]

    if params[:group_id]
      orders_group = Group.find(params[:group_id]).orders
      orders_group.each_with_index do |g, i|
        g.update_attributes(:task_id => tasks[i])
      end
    end

    if params[:user_id]
      orders_user = User.find(params[:user_id]).orders
      orders_user.each_with_index do |g, i|
        g.update_attributes(:task_id => tasks[i])
      end
    end

    render :nothing => true
  end


end
