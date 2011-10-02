class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

      t.timestamps
      t.integer :job_id
      t.boolean :public
      t.text:body
      t.integer :user_id
    end
  end
end
