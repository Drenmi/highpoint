FactoryGirl.define do
  factory :donation do
    donor

    amount 100

    trait :invalid do
      amount nil
    end
  end
end
