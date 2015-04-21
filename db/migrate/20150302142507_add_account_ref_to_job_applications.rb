class AddAccountRefToJobApplications < ActiveRecord::Migration
  def change
    add_reference :job_applications, :account, index: true
  end
end
