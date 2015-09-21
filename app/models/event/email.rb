class Event
  class Email < Event
    self.table_name = "email_events"
    self.inheritance_column = "inheritance_type"

    SENT = "Sent"
    OPENED = "Opened"
    CLICKED = "Clicked"
    TYPES = [SENT, OPENED, CLICKED].freeze

    belongs_to :prospect, :touch => true
    belongs_to :sent_email

    attr_accessible :prospect_id, :sent_email_id, :type

    def category
      "email"
    end
  end
end
