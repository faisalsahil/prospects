require 'carrierwave/orm/activerecord'

class Event
  class Call < Event
    self.table_name = "call_events"
    self.inheritance_column = "inheritance_type"

    mount_uploader :file, CallUploader

    VOICEMAIL = "Voicemail"
    INBOUND_CALL = "Inbound Call"
    CALLBACK_LATER = "Callback Later"
    REQUESTED_EMAIL = "Requested Email"
    SCHEDULED_DEMO = "Scheduled Demo"
    NUMBER_DISCONNECTED = "Number disconnected"
    GATEKEEPER = "Can't get through gatekeeper"
    NOT_INTERESTED = "Not interested"
    CURRENT_PROVIDER = "Satisfied with Current Provider"
    TOO_EXPENSIVE = "Marketforms is too expensive"

    TYPES = [VOICEMAIL, INBOUND_CALL, CALLBACK_LATER, REQUESTED_EMAIL, SCHEDULED_DEMO, NUMBER_DISCONNECTED, GATEKEEPER, NOT_INTERESTED, CURRENT_PROVIDER, TOO_EXPENSIVE].freeze

    scope :voicemail, where(:type => VOICEMAIL)
    scope :callback_later, where(:type => CALLBACK_LATER)
    scope :requested_email, where(:type => REQUESTED_EMAIL)
    scope :inbound_call, where(:type => INBOUND_CALL)
    scope :scheduled_demo, where(:type => SCHEDULED_DEMO)
    scope :not_interested, where(:type => NOT_INTERESTED)

    scope :by_date, lambda { |date| where(:created_at => (date.beginning_of_day..date.end_of_day)) }
    scope :by_week, lambda { |date| where(:created_at => (date.beginning_of_week.beginning_of_day.. date.end_of_week.end_of_day)) }
    scope :by_date_range, lambda { |start_date, end_date| where(:created_at => (start_date.beginning_of_day..end_date.end_of_day)) }

    attr_accessible :user_id, :prospect_id, :type, :response, :follow_up, :file

    belongs_to :prospect, :touch => true
    belongs_to :user

    validate :user_id,      :presence => true
    validate :prospect_id,  :presence => true
    validate :type,         :presence => true

    def category
      "call"
    end
  end
end
