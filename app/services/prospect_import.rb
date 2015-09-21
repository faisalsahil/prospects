require 'csv'

class ProspectImport
  attr_reader :path
  def initialize(*args)
    @path = args.first
  end

  def process!
    str = File.read(@path, :encoding => 'ISO-8859-1')
    CSV.parse(str) do |row|
      row.map! { |row| row.try :strip }
      prospect = Prospect.find_by_raw_cik(row[0]) || Prospect.new
      prospect.raw_cik = row[0]
      prospect.company_name = row[1]
      prospect.filer_type = row[3]
      prospect.market_cap = row[4]
      prospect.form3_filings = row[5]
      prospect.form4_filings = row[6]
      prospect.last_form_4_filed_at = row[7]
      prospect.form5_filings = row[8]
      prospect.filing_agent = row[9]
      prospect.company_address = row[10]
      prospect.phone_number = row[11]
      prospect.fax_number = row[12]
      prospect.website = row[13]
      prospect.time_zone = extract_timezone_offset(row[14])
      prospect.contact_name = "#{row[15]} #{row[16]}"
      prospect.contact_email = row[17]
      prospect.contact_position = row[18]
      prospect.save!
    end
  end

  private

  def extract_timezone_offset(str)
    if str.blank?
      nil
    elsif offset = str[/UTC\/GMT (.*) hour/, 1]
      offset
    elsif offset = str =~ /No UTC\/GMT offset/
      0
    else
      raise "unable to parse offset: #{str}"
    end
  end
end
