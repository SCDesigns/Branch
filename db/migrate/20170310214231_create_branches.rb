class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
	t.string :event
	t.string :organization
	t.date :date
	t.string :location
	t.string :info
	t.integer :user_id
  end
end
end
