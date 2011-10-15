class Comment < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :job
  belongs_to :user
  validates :body, :presence => true 
  
  scope :public, where(:public => true)
  scope :private, where(:public => false)
end
