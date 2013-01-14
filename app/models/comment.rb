class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  attr_accessible :commentable_id, :commentable_type, :content

end
