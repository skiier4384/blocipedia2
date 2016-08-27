FactoryGirl.define do
  factory :wiki do
    title "Title"
    body "Body"
    private false
    user
  end
end