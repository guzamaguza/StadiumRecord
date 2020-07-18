class User < ActiveRecord::Base
  has_many :visits
  has_many :arenas, through: :visits
  has_secure_password  #bcrypt macro to store salted/hashed pwd

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end

end
