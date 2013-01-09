class Group < ActiveRecord::Base
  has_many :tasks
  attr_accessible :description, :title
end
