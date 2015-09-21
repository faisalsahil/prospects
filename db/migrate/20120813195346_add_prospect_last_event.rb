class AddProspectLastEvent < ActiveRecord::Migration
  def up
    add_column :prospects, :last_event_id, :integer
    add_column :prospects, :last_event_type, :string
  end

  def down
    remove_column :prospects, :last_event_id
    remove_column :prospects, :last_event_type
  end
end
