class Group < ActiveRecord::Base
  has_many :tasks
  has_many :tasks_orders,  :dependent => :nullify
  attr_accessible :description, :title
end
