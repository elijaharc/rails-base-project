require 'rails_helper'

RSpec.describe 'Sign in process for broker', type: :feature do
  context 'when signing in with valid broker credentials' do
    let!(:broker) { attributes_for :broker_one }

    before do
      FactoryBot.create(:broker_one)
      visit new_broker_session_path
      within '#new_broker' do
        fill_in 'broker_email', with: broker[:email]
        fill_in 'broker_password', with: broker[:password]
        click_button 'Sign in'
      end
    end

    it 'Broker signed in success' do
      # expect(page).to have_css('#toaster-notice')
      # expect(page).to have_content 'Signed in as'
      expect(page).to have_current_path broker_index_path, ignore_query: true
    end
  end

  context 'when signing in with invalid broker credentials' do
    before do
      FactoryBot.create(:broker_one)
      visit new_broker_session_path
      within '#new_broker' do
        fill_in 'broker_email', with: 'wrongemail@gmail.com'
        fill_in 'broker_password', with: 'wrong-password'
        click_button 'Sign in'
      end
    end

    it 'Broker signed in invalid' do
      # expect(page).to have_css('#toaster-alert')
      expect(page).to have_current_path new_broker_session_path, ignore_query: true
    end
  end
end
