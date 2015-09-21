class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :prospect_assignments
  has_many :prospects, :through => :prospect_assignments
  has_many :call_events, :class_name => "Event::Call"
  has_many :called_prospects, :class_name => "Prospect", :through => :call_events, :source => :prospect, :uniq => true

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :phone

  def admin?
    ["chelsea@marketforms.com", "keith@marketforms.com", "niraj@marketforms.com", "alex@marketforms.com", "liane@marketforms.com","crobertson@marketforms.com"].include?(email)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # soft deleting a user should
  # add default_Scope of deleted_at => null
  # remove assignments
end
