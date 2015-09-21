class CreateProspectAssignments < ActiveRecord::Migration
  def change
    create_table :prospect_assignments do |t|
      t.integer :user_id
      t.integer :prospect_id
      t.timestamps
    end
    add_index :prospect_assignments, [:user_id, :prospect_id], :unique => true
  end
end
