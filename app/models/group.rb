class Group < ActiveRecord::Base
  has_many :tasks
  has_many :orders,  :dependent => :nullify
  has_many :comments, :as => :commentable
  attr_accessible :description, :title
end
