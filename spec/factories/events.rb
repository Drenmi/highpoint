FactoryGirl.define do
  factory :event do
    name "Test Event"

    trait :invalid do
      name nil
    end
  end
end
