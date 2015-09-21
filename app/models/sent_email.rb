# This probably should have just been Event::SentEmail
# Then we add Event::CampaignEmail, Event::ReceivedEmail
# Or maybe we just have Event::Email and the inbound boolean can track sent vs received.
# This assumes most emails are the same except for a few extra attributes
class SentEmail < ActiveRecord::Base
  attr_accessible :user_id, :prospect_id, :campaign_id, :solicited, :slug, :to, :name

  belongs_to :prospect
  belongs_to :campaign
  belongs_to :user

  before_create :generate_slug

  private
  def generate_slug
    true until self.slug = SecureRandom.hex(4) and SentEmail.where(:slug => self.slug).count == 0
  end
end
