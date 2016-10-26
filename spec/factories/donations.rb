FactoryGirl.define do
  factory :donation do
    donor

    amount 100

    created_at Time.zone.today

    trait :invalid do
      amount nil
    end

    factory :donation_with_cause do
      cause
    end
  end
end
