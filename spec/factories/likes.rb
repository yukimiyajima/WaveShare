FactoryBot.define do
  factory :like do
    association :user, factory: :goku
    association :topic, factory: :vegeta_topic
  end
end