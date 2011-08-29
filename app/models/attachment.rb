class Attachment < ActiveRecord::Base
  attr_accessible :file, :post_id
  belongs_to :post
  belongs_to :user
  mount_uploader :file, FileUploader
end
