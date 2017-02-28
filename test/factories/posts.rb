FactoryGirl.define do
  factory :post do
    title "MyString"
    body "MyText"
    summary "MyString"
    user
  end
end
