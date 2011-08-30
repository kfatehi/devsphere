class Post < ActiveRecord::Base
  DEPTH_LIMIT = 5 # How deep replies can nest
  belongs_to :user
  belongs_to :post
  has_many :attachments, :dependent => :destroy
  has_many :posts, :foreign_key => :parent_id
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings
  
  validates :body, :presence => true, :length=>{:minimum=>1}
  validates :user_id, :presence => true
  
  before_save :process_body

  def self.top_level
    # Only get the top level posts
    where("parent_id IS NULL").order("updated_at DESC")
  end

  def top_level
    # Return thread starter
    current_post = self
    while !current_post.top_level?
      current_post = current_post.parent
    end
    current_post
  end
 
  def top_level?
    self.parent_id ? false : true
  end

  def parent
    Post.find self.parent_id
  end 

  def replies
    self.posts
  end

  private
  def process_body
    regex = Regexp.new '((https?:\/\/|www\.)([-\w\.]+)+(:\d+)?(\/([\w\/_\.]*(\?\S+)?)?)?)'
    self.body.gsub!( regex, '<a href="\1">\1</a>' )
    self.body = strip_bad_tags(self.body)
  end

  def strip_bad_tags(s)
    # converting newlines 
    s.gsub!(/\r\n?/, "\n") 
 
    # escaping HTML to entities 
    s = s.to_s.gsub('&', '&amp;').gsub('<', '&lt;').gsub('>', '&gt;') 
 
    # blockquote tag support 
    s.gsub!(/\n?&lt;blockquote&gt;\n*(.+?)\n*&lt;\/blockquote&gt;/im, "<blockquote>\\1</blockquote>") 
 
    # other tags: b, i, em, strong, u 
    %w(b i em strong u).each { |x|
         s.gsub!(Regexp.new('&lt;(' + x + ')&gt;(.+?)&lt;/('+x+')&gt;',
                 Regexp::MULTILINE|Regexp::IGNORECASE), 
                 "<\\1>\\2</\\1>") 
        } 
 
    # A tag support 
    # href="" attribute auto-adds http:// 
    s = s.gsub(/&lt;a.+?href\s*=\s*['"](.+?)["'].*?&gt;(.+?)&lt;\/a&gt;/im) { |x|
            '<a href="' + ($1.index('://') ? $1 : 'http://'+$1) + "\">" + $2 + "</a>" 
          } 
 
    # replacing newlines to <br> ans <p> tags 
    # wrapping text into paragraph 
    s = "<p>" + s.gsub(/\n\n+/, "</p>\n\n<p>").
            gsub(/([^\n]\n)(?=[^\n])/, '\1<br />') + "</p>" 
 
    s    
end 

end
