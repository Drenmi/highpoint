FactoryGirl.define do
  factory :event do
    name "Test Event"
    start_on 1.year.ago
    end_on 1.year.ago + 1.day

    trait :invalid do
      name nil
    end
  end
end
