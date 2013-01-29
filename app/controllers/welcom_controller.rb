class WelcomController < ApplicationController
  def index
    @user = current_user
    @tasks = Task.where(user_id:[@user, nil])
  end
end
