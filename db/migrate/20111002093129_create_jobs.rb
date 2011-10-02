class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|

      t.timestamps
      t.string :service
      t.decimal :cost
      t.boolean :status, :check_status_owner, :check_status_worker
      
    end
  end
end
