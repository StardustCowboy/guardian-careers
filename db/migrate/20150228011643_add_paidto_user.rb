class AddPaidtoUser < ActiveRecord::Migration
  def change
  	add_column :users, :paid, :boolean
  end
end
