class Attachment < ActiveRecord::Base
  CATEGORIES = ["Audio", "Video", "Image", "Script", "Document", "Other"]
  attr_accessible :file, :post_id, :category
  belongs_to :post
  belongs_to :user
  validates :file, :presence => true
  validates :category, :inclusion => { :in => CATEGORIES }
  mount_uploader :file, FileUploader
  self.per_page = 30
  

  def self.new_to_old
    order("created_at DESC")
  end
end
