class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.string :ticker
      t.string :company_name
      t.string :market_cap
      t.integer :raw_cik
      t.integer :form3_filings
      t.integer :form4_filings
      t.datetime :last_form_4_filed_at
      t.integer :form5_filings
      t.string :filing_agent
      t.string :company_address
      t.string :phone_number
      t.string :fax_number
      t.string :website
      t.string :time_zone
      t.string :contact_name
      t.string :contact_email
      t.string :contact_position
      t.timestamps
    end
    add_index :prospects, :form4_filings
  end
end
