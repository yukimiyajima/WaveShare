FactoryBot.define do
  factory :topic do
    title { 'タイトル' }
    content { '内容' }
    lat { '35.330816' }
    lng { '139.429835' }
    association :user

    factory :goku_topic do
      title { 'GokuTitle' }
      content { 'GokuContent' }
      association :user, factory: :goku
    end

    factory :vegeta_topic do
      title { 'VegetaTitle' }
      content { 'VegetaContent' }
      association :user, factory: :vegeta
    end
  end
end