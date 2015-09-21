ActiveAdmin.register Prospect do
  decorate_with ProspectDecorator

  menu :priority => 2

  actions :index

  index do
    column :id
    column :priority
    column :contact_name, :sortable => :contact_name do |p|
      link_to p.contact_name, admin_old_prospect_path(p)
    end
    column :contact_email
    column :contact_position
    column "CIK", :sortable => :raw_cik do |p| p.raw_cik end
    column :company_name
    column :filing_agent
    column :time_zone
    column :form4_filings
    column :last_caller do |p|
      if p.last_event.respond_to? :user
          p.last_event.try(:user).try(:full_name)
      end
    end
    column :last_event do |p|
      p.last_event_header
    end
    column :last_event_time, :sortable => "last_event.created_at" do |p|
      p.last_event_time
    end
    column "# of calls" do |p|
      p.call_events.size
    end
    column :callers do |p|
      p.users.map(&:email).join(', ')
    end
    column :updated_at
    actions :defaults => false
  end

  filter :id
  filter :raw_cik
  filter :company_name
  filter :contact_name
  filter :time_zone
  filter :filing_agent
  filter :users
  filter :contact_email
  filter :contact_position
  filter :updated_at
  filter :priority

  controller do
    def scoped_collection
      Prospect.cold_caller_order.includes(:users, :call_events).decorate
    end
  end
end
