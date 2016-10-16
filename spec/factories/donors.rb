FactoryGirl.define do
  sequence :identification do |n|
    "G123456#{n}M"
  end

  factory :donor do
    identification

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
