class CreateBranches < ActiveRecord::Migration[5.0]
  def change
    create_table :branches do |t|
	t.string :event
	t.string :organization
	t.string :date
	t.string :location
	t.string :info
	t.integer :user_id
  end
end
end
