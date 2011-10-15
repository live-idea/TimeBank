class RemoveJobIdFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :job_id
  end

  def down
  end
end
