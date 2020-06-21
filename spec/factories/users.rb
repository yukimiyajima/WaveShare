FactoryBot.define do
  factory :user do
    name { 'test' }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }

    factory :goku do
      name { 'Goku' }
      email { 'goku@example.com' }
    end

    factory :vegeta do
      name { 'Vegeta' }
      email { 'vegeta@example.com' }
    end
  end
end