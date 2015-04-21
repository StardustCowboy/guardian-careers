class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    	t.string "address"
    	t.string "title"
    	t.string "description"
    	t.references :user
      t.timestamps
    end
    add_index :jobs, ["user_id"]
  end
end
