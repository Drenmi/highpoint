FactoryGirl.define do
  factory :cause do
    shortcode "HH"
    name "Halfway House"

    trait :invalid do
      name nil
    end
  end
end
