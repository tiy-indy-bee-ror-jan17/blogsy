FactoryGirl.define do
  factory :user do
    username { Faker::StarWars.unique.specie }
    email { Faker::Internet.safe_email }
    bio { Faker::TwinPeaks.quote }
  end
end
