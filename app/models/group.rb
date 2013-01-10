class Group < ActiveRecord::Base
  has_many :tasks
  has_many :group_tasks_orderses
  attr_accessible :description, :title
end
