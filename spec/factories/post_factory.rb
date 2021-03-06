# This will guess the Post class
FactoryGirl.define do
  factory :post do
    url Faker::Internet.url
    title Faker::Hacker.say_something_smart
    association :user, factory: :new_user
  end
end
