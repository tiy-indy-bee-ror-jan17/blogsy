FactoryGirl.define do
  factory :user do
    username { Faker::StarWars.specie }
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
    bio { Faker::TwinPeaks.quote }
  end
end
