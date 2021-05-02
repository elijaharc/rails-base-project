require 'rails_helper'

RSpec.describe 'Sign up process for buyer', type: :feature do
  context 'when signing up with valid input' do
    before do
      FactoryBot.create(:admin)
      visit new_buyer_registration_path
      within '#new_buyer' do
        fill_in 'buyer_email', with: 'mcnikkopinlac@gmail.com'
        fill_in 'buyer_password', with: '123456'
        fill_in 'buyer_password_confirmation', with: '123456'
        click_button 'Sign up'
      end
    end

    it 'Buyer sign up success, will receive confirmation email' do
      expect(page).to have_css('#toaster-notice')
    end
  end
end
