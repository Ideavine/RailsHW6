class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
    	t.string :title
    	t.integer :post_id
    	t.integer :forum_id


      t.timestamps
    end
  end
end
