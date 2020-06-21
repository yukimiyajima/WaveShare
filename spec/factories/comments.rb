FactoryBot.define do
  factory :comment do
    association :topic
    association :user
    content { "コメント" }
  end
end