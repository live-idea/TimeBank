class AddBillToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bill, :decimal
  end
end
