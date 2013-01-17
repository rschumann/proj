class User < ActiveRecord::Base
  has_many :tasks
  has_many :orders,  :dependent => :nullify
  has_many :attached_assets, :as => :attachable
  accepts_nested_attributes_for :attached_assets, :allow_destroy => true
  attr_accessible :description, :title, :avatar, :attached_assets_attributes
  has_attached_file :avatar, :styles => { :small => "150x150>" }

  validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
end
