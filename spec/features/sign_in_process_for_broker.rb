require 'rails_helper'

RSpec.describe 'Sign in process for broker', type: :feature do
  let!(:broker) { attributes_for :broker_one}

  before do
    broker = FactoryBot.create(:broker_one)
  end

  it 'Should sign me in as a broker when I input VALID broker details' do
    visit new_broker_session_path

    within '#new_broker' do
      fill_in 'broker_email', with: broker[:email]
      fill_in 'broker_password', with: broker[:password]

      click_button 'Sign in'
    end

    expect(page).to have_css("#toaster-notice")
    expect(page).to have_content 'Signed in as'
    expect(page.current_path).to eq broker_index_path
  end

  it 'Should not sign me in as a broker when I input INVALID broker details' do
    visit new_broker_session_path

    within '#new_broker' do
      fill_in 'broker_email', with: 'wrongemail@gmail.com'
      fill_in 'broker_password', with: 'wrong-password'

      click_button 'Sign in'
    end
    
    expect(page).to have_css("#toaster-alert")
    expect(page.current_path).to eq new_broker_session_path
  end
end