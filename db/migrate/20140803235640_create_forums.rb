class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
    	t.string :topic_id
    	t.string :title
      t.timestamps
    end
  end
end
