class JobGpaDataTypeSwitch < ActiveRecord::Migration
  def up
  	remove_column :jobs, :gpa
  	add_column :jobs, :gpa, :float
  end

  def down
  	remove_column :jobs, :gpa
  	add_column :jobs, :gpa, :boolean

  end
end
