class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :resume
      t.string :transcript
      t.string :address
      t.string :experience
      t.string :email
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
