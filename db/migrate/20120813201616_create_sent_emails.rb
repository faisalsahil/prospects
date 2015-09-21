class CreateSentEmails < ActiveRecord::Migration
  def change
    create_table :sent_emails do |t|
      t.string :slug, :limit => 10
      t.string :to
      t.string :name
      t.integer :user_id
      t.integer :prospect_id
      t.integer :campaign_id
      t.boolean :solicited
      t.timestamps
    end
    add_index :sent_emails, :slug, :unique => true
    add_index :sent_emails, :prospect_id
    add_index :sent_emails, :campaign_id
    add_index :sent_emails, :created_at
  end
end
