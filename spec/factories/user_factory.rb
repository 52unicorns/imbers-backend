FactoryGirl.define do
  factory :user, aliases: [:user1, :user2] do
    sequence(:facebook_uid) { |n| "#{n}" }
  end
end
