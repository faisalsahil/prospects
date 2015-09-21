class AddFilerType < ActiveRecord::Migration
  def up
    add_column :prospects, :filer_type, :string
  end

  def down
    remove_column :prospects, :filer_type
  end
end
