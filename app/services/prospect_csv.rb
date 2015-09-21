require 'csv'

class ProspectCSV
  HEADERS = {
    "Prospect ID"      => :id,
    "CIK"              => :cik,
    "Priority"         => :priority,
    "Phone Number"     => :phone_number,
    "Filing Agent"     => :filing_agent,
    "Contact Name"     => :contact_name,
    "Contact Email"    => :contact_email,
    "Contact Position" => :contact_position,
    "Company Name"     => :company_name,
    "Ticker"           => :ticker,
    "Company Address"  => :company_address,
    "Website"          => :website,
    "Time Zone"        => :time_zone
  }

  def self.generate
    CSV.generate do |csv|
      csv << HEADERS.keys
      Prospect.includes(:last_event).find_each do |prospect|
        csv << HEADERS.values.map { |attr| prospect.send(attr).to_s }
      end
    end
  end
end
