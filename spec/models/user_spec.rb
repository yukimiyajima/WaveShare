require 'rails_helper'

RSpec.describe User, type: :model do
  it '内容がある場合は有効' do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it 'メールアドレスが無い場合は無効' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include(I18n.t('errors.messages.blank'))
  end

  it 'パスワードが無い場合は無効' do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include(I18n.t('errors.messages.blank'))
  end

  it '名前が無い場合は無効' do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include(I18n.t('errors.messages.blank'))
  end

  it 'user削除時に関連付いたtopicが削除されること' do
    topic = FactoryBot.create(:topic)
    user = topic.user
    expect { user.destroy }.to change { Topic.count }.by(-1)
  end
end