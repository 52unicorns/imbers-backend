FactoryGirl.define do
  factory :message do
    body 'test'
    user
    match
  end
end
