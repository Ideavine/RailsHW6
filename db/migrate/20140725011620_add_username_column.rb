class AddUsernameColumn < ActiveRecord::Migration
  def change
  	add_column :users, :username, :stringrai
  end
end
