class Candidate < ActiveRecord::Base
  belongs_to :job
  belongs_to :user
  has_many :comments
end
