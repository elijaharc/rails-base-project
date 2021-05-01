require 'rails_helper'

RSpec.describe 'Sign in process for buyer', type: :feature do
  let!(:buyer) { attributes_for :buyer}

  before do
    buyer = FactoryBot.create(:buyer)
  end

  it 'Should sign me in as a buyer when I input VALID buyer details' do
    visit new_buyer_session_path

    within '#new_buyer' do
      fill_in 'buyer_email', with: buyer[:email]
      fill_in 'buyer_password', with: buyer[:password]

      click_button 'Sign in'
    end

    expect(page).to have_css("#toaster-notice")
    expect(page).to have_content 'Signed in as'
    expect(page.current_path).to eq buyer_index_path
  end

  it 'Should not sign me in as a buyer when I input INVALID buyer details' do
    visit new_buyer_session_path

    within '#new_buyer' do
      fill_in 'buyer_email', with: 'wrongemail@gmail.com'
      fill_in 'buyer_password', with: 'wrong-password'

      click_button 'Sign in'
    end
    
    expect(page).to have_css("#toaster-alert")
    expect(page.current_path).to eq new_buyer_session_path
  end
end