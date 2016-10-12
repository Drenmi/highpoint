FactoryGirl.define do
  factory :event do
    name "Test Event"
    start_on 1.year.ago
    end_on 1.year.ago + 1.day

    trait :invalid do
      name nil
    end

    factory :event_with_donations do
      after(:create) do |event|
        create_list(:donation, 2, event: event)
      end
    end
  end
end
