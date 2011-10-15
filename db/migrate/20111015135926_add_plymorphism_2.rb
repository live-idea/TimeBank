class AddPlymorphism2 < ActiveRecord::Migration
  def up
     add_column :comments, :commentable_id, :integer
     add_column :comments, :commentable_type, :string
     remove_column :comments, :job_id
  end

  def down
  end
end
