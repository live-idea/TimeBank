class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|

      t.timestamps
      t.integer :user_id, :job_id
      
    end
  end
end
