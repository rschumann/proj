class User < ActiveRecord::Base
  has_many :tasks
  has_many :orders,  :dependent => :nullify
  attr_accessible :description, :title
end
