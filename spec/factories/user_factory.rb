# This will guess the User class
FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    username Faker::Internet.email
    password Faker::Internet.password(8)
  end
  factory :new_user, class: User do
    name { Faker::Name.name }
    username { Faker::Internet.email }
    password { Faker::Internet.password(8) }
  end
end
