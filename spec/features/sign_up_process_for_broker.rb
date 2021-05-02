require 'rails_helper'

RSpec.describe 'Sign up process for broker', type: :feature do
  context 'when signing up with valid input' do
    before do
      FactoryBot.create(:admin)
      visit new_broker_registration_path
      within '#new_broker' do
        fill_in 'broker_broker_name', with: 'Mcnikko Pinlac'
        fill_in 'broker_email', with: 'mcnikkopinlac@gmail.com'
        fill_in 'broker_password', with: '123456'
        fill_in 'broker_password_confirmation', with: '123456'
        click_button 'Sign up'
      end
    end

    it 'Broker sign up success, will receive a confirmation email' do
      expect(page).to have_css('#toaster-notice')
    end
  end

  context 'when signing up with mismatched passwords' do
    before do
      FactoryBot.create(:admin)
      visit new_broker_registration_path
      within '#new_broker' do
        fill_in 'broker_broker_name', with: 'Mcnikko Pinlac'
        fill_in 'broker_email', with: 'mcnikkopinlac@gmail.com'
        fill_in 'broker_password', with: '123456'
        fill_in 'broker_password_confirmation', with: '123457'
        click_button 'Sign up'
      end
    end

    it 'Broker sign up error, a red toastr message will appear' do
      expect(page).to have_css('#toaster-notice')
    end
  end

  context 'when signing up with invalid email' do
    before do
      FactoryBot.create(:admin)
      visit new_broker_registration_path
      within '#new_broker' do
        fill_in 'broker_broker_name', with: 'Mcnikko Pinlac'
        fill_in 'broker_email', with: 'mcnikkopinlac'
        fill_in 'broker_password', with: '123456'
        fill_in 'broker_password_confirmation', with: '123456'
        click_button 'Sign up'
      end
    end

    it 'Broker sign up error, a prompt showing incomplete email' do
      expect(page).to have_current_path new_broker_registration_path, ignore_query: true
    end
  end

  context 'when signing up with a taken email address' do
    before do
      FactoryBot.create(:admin)
      visit new_broker_registration_path
      within '#new_broker' do
        fill_in 'broker_broker_name', with: 'Mcnikko Pinlac'
        fill_in 'broker_email', with: 'mcnikkopinlac@gmail.com'
        fill_in 'broker_password', with: '123456'
        fill_in 'broker_password_confirmation', with: '123456'
        click_button 'Sign up'
      end
      visit new_broker_registration_path
      within '#new_broker' do
        fill_in 'broker_broker_name', with: 'Mcnikko Pinlac'
        fill_in 'broker_email', with: 'mcnikkopinlac@gmail.com'
        fill_in 'broker_password', with: '123456'
        fill_in 'broker_password_confirmation', with: '123456'
        click_button 'Sign up'
      end
    end

    it 'Broker sign up error, a red toastr message will appear' do
      expect(page).to have_css('#toaster-notice')
    end
  end

  context 'when signing up with a blank broker name' do
    before do
      FactoryBot.create(:admin)
      visit new_broker_registration_path
      within '#new_broker' do
        fill_in 'broker_broker_name', with: ''
        fill_in 'broker_email', with: 'mcnikkopinlac@gmail.com'
        fill_in 'broker_password', with: '123456'
        fill_in 'broker_password_confirmation', with: '123456'
        click_button 'Sign up'
      end
    end

    it 'Broker sign up error, a red toastr message will appear' do
      expect(page).to have_css('#toaster-notice')
    end
  end
end
