class AddCandidateIdToJob_ < ActiveRecord::Migration
  def up
    add_column :jobs, :candidate_id, :integer
  end
end
