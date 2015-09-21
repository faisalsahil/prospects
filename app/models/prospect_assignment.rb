class ProspectAssignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :prospect

  attr_accessible :user_id, :prospect_id
end
