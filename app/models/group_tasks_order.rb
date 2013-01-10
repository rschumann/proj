class GroupTasksOrder < ActiveRecord::Base
  belongs_to :group
  belongs_to :task
  attr_accessible :group_id, :order, :task_id
end
