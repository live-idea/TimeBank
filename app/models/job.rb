class Job < ActiveRecord::Base
  belongs_to :user
  has_many :candidates
  has_many :comments
  belongs_to :worker, :class_name=>"Candidate", :foreign_key => :worker_id
  validates :cost, :name, :presence => :true
  validates :description, :length => {:in => 10..950}
  validates :status, :inclusion => { :in => ["free", "in process", "finished"]}
  
end
