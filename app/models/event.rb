# Consider turning this into a concrete class that acts as the mechanism for easy query of all interactions 
# Then we wouldn't have to do things like (call_events + email_events).sort_by(&:created_at)
#     create_table :events do |t|
#       t.integer :user_id
#       t.integer :prospect_id
#       t.integer :eventable_id
#       t.string  :eventable_type
#     end
class Event < ActiveRecord::Base
  self.abstract_class = true

  def self.create_from_api!(opts={})
    case opts.delete(:category)
    when "call"
      Event::Call.create!(opts)
    when "email"
      Event::Email.create!(opts)
    else
      raise ArgumentError, "unknown category"
    end
  end
end
