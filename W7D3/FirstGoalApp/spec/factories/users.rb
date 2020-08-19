FactoryBot.define do
  factory :user do
    username {Faker::Games::Pokemon.name}
    password { "Testing123" }
  end
end
