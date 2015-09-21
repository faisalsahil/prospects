FactoryGirl.define do
  sequence :slug do |n|
    "slug-#{n}"
  end

  factory :sent_email do
    slug
    to "keith.tom@gmail.com"
    prospect { FactoryGirl.create(:snda) }
  end
end
