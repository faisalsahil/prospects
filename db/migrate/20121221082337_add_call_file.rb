class AddCallFile < ActiveRecord::Migration
  def up
    add_column :call_events, :file, :string
  end

  def down
    remove_column :call_events, :file
  end
end
