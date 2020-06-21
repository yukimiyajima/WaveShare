require 'rails_helper'

RSpec.describe Like, type: :model do
  let!(:like) { FactoryBot.create(:like) }
  let!(:goku) { like.user }
  let!(:vegeta_topic) { like.topic }

  it '内容がある場合は有効' do
    expect(like).to be_valid
  end

  it 'user_idが無い場合は無効' do
    topic = FactoryBot.build(:like, user_id: nil)
    topic.valid?
    expect(topic.errors[:user_id]).to include(I18n.t('errors.messages.blank'))
  end

  it 'topic_idが無い場合は無効' do
    topic = FactoryBot.build(:like, topic_id: nil)
    topic.valid?
    expect(topic.errors[:topic_id]).to include(I18n.t('errors.messages.blank'))
  end

  it 'topicとuserが関連付いていること' do
    expect(goku.like_topics).to include(vegeta_topic)
    expect(vegeta_topic.like_users).to include(goku)
  end

  it 'user削除時に関連付いたlikeが削除されること' do
    expect { goku.destroy }.to change { Like.count }.by(-1)
  end

  it 'topic削除時に関連付いたlikeが削除されること' do
    expect { vegeta_topic.destroy }.to change { Like.count }.by(-1)
  end
end