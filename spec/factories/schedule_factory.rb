FactoryBot.define do
  factory :schedule do
    starts_at { Faker::Date.forward(days: 5) }
    ends_at { Faker::Date.forward(days: 5) }

  end

  factory :invalid_schedule, parent: :schedule do
    starts_at { Faker::Date.backward(days: 1) }
    ends_at { Faker::Date.backward(days: 2) }
  end
end