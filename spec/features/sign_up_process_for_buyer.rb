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

    it 'Buyer sign up success, will receive a confirmation email' do
      expect(page).to have_css('#toaster-notice')
    end
  end

  context 'when signing up with mismatched passwords' do
    before do
      FactoryBot.create(:admin)
      visit new_buyer_registration_path
      within '#new_buyer' do
        fill_in 'buyer_email', with: 'mcnikkopinlac@gmail.com'
        fill_in 'buyer_password', with: '123456'
        fill_in 'buyer_password_confirmation', with: '123457'
        click_button 'Sign up'
      end
    end

    it 'Buyer sign up error, a red toastr message will appear' do
      expect(page).to have_css('#toaster-notice')
    end
  end

  context 'when signing up with invalid email' do
    before do
      FactoryBot.create(:admin)
      visit new_buyer_registration_path
      within '#new_buyer' do
        fill_in 'buyer_email', with: 'mcnikkopinlac'
        fill_in 'buyer_password', with: '123456'
        fill_in 'buyer_password_confirmation', with: '123456'
        click_button 'Sign up'
      end
    end

    it 'Buyer sign up error, a prompt showing incomplete email' do
      expect(page).to have_current_path new_buyer_registration_path, ignore_query: true
    end
  end

  context 'when signing up with a taken email address' do
    before do
      FactoryBot.create(:admin)
      visit new_buyer_registration_path
      within '#new_buyer' do
        fill_in 'buyer_email', with: 'mcnikkopinlac@gmail.com'
        fill_in 'buyer_password', with: '123456'
        fill_in 'buyer_password_confirmation', with: '123456'
        click_button 'Sign up'
      end
      visit new_buyer_registration_path
      within '#new_buyer' do
        fill_in 'buyer_email', with: 'mcnikkopinlac@gmail.com'
        fill_in 'buyer_password', with: '123456'
        fill_in 'buyer_password_confirmation', with: '123456'
        click_button 'Sign up'
      end
    end

    it 'Buyer sign up error, a red toastr message will appear' do
      expect(page).to have_css('#toaster-notice')
    end
  end
end
