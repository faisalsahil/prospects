class ChangeResponseType < ActiveRecord::Migration
  def up
    change_column :call_events, :response, :text
  end

  def down
    change_column :call_events, :response, :string
  end
end
