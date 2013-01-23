class AttachedAsset < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  has_attached_file :asset, :styles => { :mini => "320x240#", :normal => "800x400#" }
  attr_accessible :asset, :asset_file_name
end
