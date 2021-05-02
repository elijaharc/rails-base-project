require 'rails_helper'

RSpec.describe 'Sign in process for buyer', type: :feature do
  context 'when signing in with valid buyer credentials' do
    let!(:buyer) { attributes_for :buyer }

    before do
      FactoryBot.create(:buyer)
      visit new_buyer_session_path
      within '#new_buyer' do
        fill_in 'buyer_email', with: buyer[:email]
        fill_in 'buyer_password', with: buyer[:password]
        click_button 'Sign in'
      end
    end

    it 'Buyer signed in success' do
      # expect(page).to have_css('#toaster-notice')
      # expect(page).to have_content 'Signed in as'
      expect(page).to have_current_path buyer_index_path, ignore_query: true
    end
  end

  context 'when signing in with invalid buyer credentials' do
    before do
      FactoryBot.create(:buyer)
      visit new_buyer_session_path
      within '#new_buyer' do
        fill_in 'buyer_email', with: 'wrongemail@gmail.com'
        fill_in 'buyer_password', with: 'wrong-password'
        click_button 'Sign in'
      end
    end

    it 'Buyer signed in invalid' do
      # expect(page).to have_css('#toaster-alert')
      expect(page).to have_current_path new_buyer_session_path, ignore_query: true
    end
  end
end
