class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :posts, :foreign_key => :parent_id
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings
  
  def self.top_level
    # Only get the top level posts
    where("parent_id IS NULL")
  end
  
  def replies
    self.posts
  end
end
