class User < ActiveRecord::Base
  ADMINS = ["keyvanfatehi@gmail.com"]
  has_many :posts
  has_many :attachments
  validates :nickname, :presence=>true, :uniqueness=>true
  validates :email, :uniqueness=>true
  validates :password, :length=>{:minimum=>3}
# Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :nickname, :email, :password, :password_confirmation, :remember_me
  attr_protected :is_admin, :points
  
  before_create :initial_setup
  after_create :send_welcome_email

  def self.online_users
    time_range = 30.seconds.ago..Time.now
    where(:last_request_at=>time_range).all.map {|u| u.nickname }
  end

  def gravatar
    "http://www.gravatar.com/avatar.php?gravatar_id=#{Digest::MD5.hexdigest self.email}&default=identicon"
  end
  
  def give_points_for(post)
    points = self.points + post.attachments.count + 1
    self.update_column(:points, points)
  end

  def admin?
    self.is_admin
  end

  def admin!
    self.update_column(:is_admin, true)
  end

  def unadmin!
    self.update_column(:is_admin, false)
  end

  def initial_setup
    self.is_admin = ADMINS.include?(self.email)
    self.points = 0
  end
  
  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end
end
