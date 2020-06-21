require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:comment) { FactoryBot.create(:comment) }
  let!(:topic) { comment.topic }
  let!(:user) { comment.user }

  it '内容がある場合は有効' do
    expect(FactoryBot.create(:comment)).to be_valid
  end

  it '内容が無い場合は無効' do
    comment = FactoryBot.build(:comment, content: nil)
    comment.valid?
    expect(comment.errors[:content]).to include(I18n.t('errors.messages.blank'))
  end

  it 'topic削除時に関連付いているcommentが削除される' do
    expect { topic.destroy }.to change { Comment.count }.by(-1)
  end
  
  it 'user削除時に関連付いているcommentが削除される' do
    expect { user.destroy }.to change { Comment.count }.by(-1)
  end
end