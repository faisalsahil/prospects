# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140116051524) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "call_events", :force => true do |t|
    t.integer  "prospect_id"
    t.integer  "user_id"
    t.string   "type",        :limit => 32
    t.text     "response"
    t.datetime "follow_up"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "file"
  end

  add_index "call_events", ["created_at"], :name => "index_call_events_on_created_at"
  add_index "call_events", ["prospect_id"], :name => "index_call_events_on_prospect_id"

  create_table "email_events", :force => true do |t|
    t.integer  "prospect_id"
    t.integer  "sent_email_id"
    t.string   "type",          :limit => 32
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "email_events", ["created_at"], :name => "index_email_events_on_created_at"
  add_index "email_events", ["prospect_id"], :name => "index_email_events_on_prospect_id"

  create_table "prospect_assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "prospect_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "prospect_assignments", ["user_id", "prospect_id"], :name => "index_prospect_assignments_on_user_id_and_prospect_id", :unique => true

  create_table "prospects", :force => true do |t|
    t.string   "ticker"
    t.string   "company_name"
    t.string   "market_cap"
    t.integer  "raw_cik"
    t.integer  "form3_filings"
    t.integer  "form4_filings"
    t.datetime "last_form_4_filed_at"
    t.integer  "form5_filings"
    t.string   "filing_agent"
    t.string   "company_address"
    t.string   "phone_number"
    t.string   "fax_number"
    t.string   "website"
    t.string   "time_zone"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "contact_position"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "priority",             :default => 0
    t.integer  "last_event_id"
    t.string   "last_event_type"
    t.boolean  "emailable",            :default => true
    t.string   "filer_type"
  end

  add_index "prospects", ["form4_filings"], :name => "index_prospects_on_form4_filings"
  add_index "prospects", ["priority"], :name => "index_prospects_on_priority"

  create_table "sent_emails", :force => true do |t|
    t.string   "slug",        :limit => 10
    t.string   "to"
    t.string   "name"
    t.integer  "user_id"
    t.integer  "prospect_id"
    t.integer  "campaign_id"
    t.boolean  "solicited"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "sent_emails", ["campaign_id"], :name => "index_sent_emails_on_campaign_id"
  add_index "sent_emails", ["created_at"], :name => "index_sent_emails_on_created_at"
  add_index "sent_emails", ["prospect_id"], :name => "index_sent_emails_on_prospect_id"
  add_index "sent_emails", ["slug"], :name => "index_sent_emails_on_slug", :unique => true

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "phone"
    t.string   "last_name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
