class Visit < ActiveRecord::Base
  belongs_to :user
  belongs_to :arena

  #ActiveRecord validations
  validates :date, :arena, presence: true
end
