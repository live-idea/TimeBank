class Comment < ActiveRecord::Base
def before_save
  self.bill = 1
end
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  validates :body, :presence => true 
  scope :public, where(:public => true)
  scope :private, where(:public => false)
end
