FactoryGirl.define do
  factory :donor do
    identification "G1234567M"

    trait :invalid do
      identification nil
    end

    factory :donor_with_donations do
      after(:create) do |donor|
        create_list(:donation, 2, donor: donor)
      end
    end
  end
end
