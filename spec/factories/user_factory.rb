FactoryGirl.define do
  factory :user, aliases: [:user1, :user2] do
    first_name 'Test'
    last_name 'User'
    sequence(:facebook_uid) { |n| "#{n}" }
  end
end
