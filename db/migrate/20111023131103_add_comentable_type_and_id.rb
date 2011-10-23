class AddComentableTypeAndId < ActiveRecord::Migration
  def up
    add_column :comments, :comentable_type, :string
    add_column :comments, :comentable_id, :integer
  end

  def down
  end
end
