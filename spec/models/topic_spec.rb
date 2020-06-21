require 'rails_helper'

RSpec.describe Topic, type: :model do
  it '内容がある場合は有効' do
    expect(FactoryBot.create(:topic)).to be_valid
  end

  it '内容が無い場合は無効' do
    topic = FactoryBot.build(:topic, content: nil)
    topic.valid?
    expect(topic.errors[:content]).to include(I18n.t('errors.messages.blank'))
  end

  it '緯度が無い場合は無効' do
    topic = FactoryBot.build(:topic, lat: nil)
    topic.valid?
    expect(topic.errors[:lat]).to include(I18n.t('errors.messages.blank'))
  end

  it '経度が無い場合は無効' do
    topic = FactoryBot.build(:topic, lng: nil)
    topic.valid?
    expect(topic.errors[:lng]).to include(I18n.t('errors.messages.blank'))
  end

  it 'user_idが無い場合は無効' do
    topic = FactoryBot.build(:topic, user_id: nil)
    topic.valid?
    expect(topic.errors[:user_id]).to include(I18n.t('errors.messages.blank'))
  end
end