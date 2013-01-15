class Order < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  belongs_to :task
  attr_accessible :group_id, :task_id, :user_id
end
