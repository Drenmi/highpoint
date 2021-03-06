FactoryGirl.define do
  sequence :identification do |n|
    "G123456#{n}M"
  end

  factory :donor do
    identification

    name "Test"

    postal_code "111222"

    trait :invalid do
      identification nil
    end

    factory :donor_with_donations do
      after(:create) do |donor|
        create_list(:donation, 2, donor: donor)
        create_list(:donation_with_cause, 2, donor: donor)
      end
    end
  end
end
