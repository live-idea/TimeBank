class AddComentableTypeAndId2 < ActiveRecord::Migration
  def up
    add_column :comments, :commentable_type, :string
    add_column :comments, :commentable_id, :integer
  end

  def down
  end
end
