FactoryGirl.define do
  sequence :email do |n|
    "user.#{n}@example.com"
  end

  factory :user do
    email
    password "testing"
    password_confirmation "testing"
  end
end
