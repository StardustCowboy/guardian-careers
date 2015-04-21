class AddLicenseToJobApplications < ActiveRecord::Migration
  def change
    add_column :job_applications, :license, :string
  end
end
