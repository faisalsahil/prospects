class CreateEvents < ActiveRecord::Migration
  def change
    create_table :call_events do |t|
      t.integer :prospect_id
      t.integer :user_id
      t.string :type, :limit => 32
      t.string :response
      t.datetime :follow_up
      t.timestamps
    end
    add_index :call_events, :prospect_id
    add_index :call_events, :created_at

    create_table :email_events do |t|
      t.integer :prospect_id
      t.integer :sent_email_id
      t.string :type, :limit => 32
      t.timestamps
    end
    add_index :email_events, :prospect_id
    add_index :email_events, :created_at
  end
end
