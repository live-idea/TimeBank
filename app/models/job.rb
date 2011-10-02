class Job < ActiveRecord::Base
  belongs_to :user
  has_many :candidates
  has_many :comments
  belongs_to :worker, :class_name=>"Candidate", :foreign_key => :worker_id
end
