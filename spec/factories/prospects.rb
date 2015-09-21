FactoryGirl.define do
  factory :snda, :class => "Prospect" do
    ticker "SNDA"
    company_name "Shanda Interactive Entertainment, Ltd."
    market_cap "$2,663,524,500"
    raw_cik 1278308
    form3_filings nil
    form4_filings nil
    last_form_4_filed_at nil
    form5_filings nil
    filing_agent "Shanda Interactive Entertainment, Ltd."
    company_address "No. 208 Juli Road, Pudong New Area  SHANGHAI, SHA 201203  China."
    phone_number "86-21-60588688"
    fax_number "86-21-50805132"
    website "http://www.snda.com"
    time_zone "UTC/GMT +8 hours"
    contact_name "Grace Wu"
    contact_email "gracewu@snda.com"
    contact_position "Chief Financial Officer"
  end
end

