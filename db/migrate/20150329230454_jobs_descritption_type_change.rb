class JobsDescritptionTypeChange < ActiveRecord::Migration
  def up
  	 remove_column :jobs, :description
  	 add_column :jobs, :description, :text
  end

  def down
  	remove_column :jobs, :description
  	add_column :jobs, :description, :string
  end
end
