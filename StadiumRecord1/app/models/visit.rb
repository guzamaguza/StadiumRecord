class Visit < ActiveRecord::Base
  belongs_to :user
  has_many  :stadiums

end
