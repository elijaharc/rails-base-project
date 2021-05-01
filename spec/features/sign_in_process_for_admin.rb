require 'rails_helper'

RSpec.describe 'Sign in process for admin', type: :feature do
  context 'when valid admin credentials' do
    let!(:admin) { attributes_for :admin }

    before do
      FactoryBot.create(:admin)
      visit new_admin_session_path
      within '#new_admin' do
        fill_in 'admin_email', with: admin[:email]
        fill_in 'admin_password', with: admin[:password]
        click_button 'Sign in'
      end
    end

    it 'Admin sign in success' do
      # expect(page).to have_css('#toaster-notice')
      # expect(page).to have_content 'Signed in as'
      expect(page).to have_current_path admin_index_path, ignore_query: true
    end
  end

  context 'when invalid admin credentials' do
    before do
      FactoryBot.create(:admin)
      visit new_admin_session_path
      within '#new_admin' do
        fill_in 'admin_email', with: 'wrongemail@gmail.com'
        fill_in 'admin_password', with: 'wrong-password'
        click_button 'Sign in'
      end
    end

    it 'Admin sign in invalid' do
      # expect(page).to have_css('#toaster-alert')
      expect(page).to have_current_path new_admin_session_path, ignore_query: true
    end
  end
end
