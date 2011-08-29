class User < ActiveRecord::Base
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

  def gravatar
    "http://www.gravatar.com/avatar.php?gravatar_id=#{Digest::MD5.hexdigest self.email}&default=identicon"
  end
end
