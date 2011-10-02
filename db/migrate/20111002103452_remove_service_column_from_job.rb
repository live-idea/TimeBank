class RemoveServiceColumnFromJob < ActiveRecord::Migration
  def up
    remove_column :jobs, :service
    add_column :jobs, :name, :string
    add_column :jobs, :description, :text
    add_column :jobs, :user_id, :integer
    add_column :jobs, :worker_id, :integer
    remove_column :jobs, :status
    add_column :jobs, :status, :string
    add_column :candidates, :status, :string
  end

  def down
    
  end
end
