require 'rails_helper'

RSpec.describe "users", type: :system do
  describe 'ログインページ' do
    before do
      visit new_user_session_path
    end
    context 'ゲストログインを押すと' do
      it 'ゲストログインができる' do
        click_link('ゲストログイン')
        expect(page).to have_content('WaveShare')
      end
    end
  end
end