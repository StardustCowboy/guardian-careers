class AddRequirementsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :gpa, :boolean
    add_column :jobs, :transcript, :boolean
    add_column :jobs, :license, :boolean
    add_column :jobs, :resume, :boolean
  end
end
