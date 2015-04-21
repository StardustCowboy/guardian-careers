class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.float :longitude
      t.float :latitude
      t.string :email
      t.references :user, index: true

      t.timestamps
    end
  end
end
