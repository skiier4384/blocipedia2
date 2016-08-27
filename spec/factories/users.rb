FactoryGirl.define do
  pw = "Password"

  factory :user do
    sequence(:name) {|n|"#{n}#{"Name"}"}
    sequence(:email){|n| "user#{n}@factory.com"}
    password pw
    password_confirmation pw
    role :standard
  end
end