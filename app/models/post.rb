class Post < ActiveRecord::Base
  DEPTH_LIMIT = 1 # How deep replies can nest
  belongs_to :user
  belongs_to :post
  has_many :attachments
  has_many :posts, :foreign_key => :parent_id
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings
  
  validates :body, :presence => true, :length=>{:minimum=>1}
  validates :user_id, :presence => true
  
  def self.top_level
    # Only get the top level posts
    where("parent_id IS NULL").order("updated_at DESC")
  end
  
  def replies
    self.posts
  end
end
