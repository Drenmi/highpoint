FactoryGirl.define do
  sequence :name do |n|
    "Cause #{n}"
  end

  factory :cause do
    shortcode "HH"
    name

    trait :invalid do
      name nil
    end
  end
end
