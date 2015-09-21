class AddProspectPriority < ActiveRecord::Migration
  def up
    add_column :prospects, :priority, :integer, :default => 0
    add_index :prospects, :priority
  end

  def down
    remove_column :prospects, :priority
  end
end
