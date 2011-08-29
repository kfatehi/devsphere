class Attachment < ActiveRecord::Base
  attr_accessible :file, :post_id
  belongs_to :post
  belongs_to :user
  validates :file, :presence => true
  mount_uploader :file, FileUploader
end
