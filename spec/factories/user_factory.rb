FactoryGirl.define do
  factory :user do
    sequence(:facebook_uid) { |n| "#{n}" }
  end
end
