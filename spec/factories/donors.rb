FactoryGirl.define do
  factory :donor do
    identification "G1234567M"

    trait :invalid do
      identification nil
    end
  end
end
