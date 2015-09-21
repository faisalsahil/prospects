class AddProspectEmailable < ActiveRecord::Migration
  def up
    add_column :prospects, :emailable, :boolean, :default => true
  end

  def down
    remove_column :prospects, :emailable
  end
end
