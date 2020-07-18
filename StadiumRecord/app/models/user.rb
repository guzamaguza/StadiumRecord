class User < ActiveRecord::Base
  has_many :visits
  has_many :arenas, through: :visits
  has_secure_password  #bcrypt macro to store salted/hashed pwd

  #ActiveRecord validations
  validates :username, :email, presence: true
  validates :username, uniqueness: true
  #has_secure_password already has a built in validator for password

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end

end
