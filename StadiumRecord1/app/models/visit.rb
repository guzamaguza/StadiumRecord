class Visit < ActiveRecord::Base
  belongs_to :user
  has_many :arenas

end
