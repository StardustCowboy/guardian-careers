class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
    	t.references :job
    	t.references :user
      t.timestamps
    end
    add_index :job_applications, ["user_id", "job_id"]
  end
end
