require 'rails_helper'

RSpec.describe 'Sign in process for admin', type: :feature do
  let!(:admin) { attributes_for :admin}

  before do
    admin = FactoryBot.create(:admin)
  end

  it 'Should sign me in as a admin when I input VALID admin details' do
    visit new_admin_session_path

    within '#new_admin' do
      fill_in 'admin_email', with: admin[:email]
      fill_in 'admin_password', with: admin[:password]

      click_button 'Sign in'
    end

    expect(page).to have_css("#toaster-notice")
    expect(page).to have_content 'Signed in as'
    expect(page.current_path).to eq admin_index_path
  end

  it 'Should not sign me in as a admin when I input INVALID admin details' do
    visit new_admin_session_path

    within '#new_admin' do
      fill_in 'admin_email', with: 'wrongemail@gmail.com'
      fill_in 'admin_password', with: 'wrong-password'

      click_button 'Sign in'
    end
    
    expect(page).to have_css("#toaster-alert")
    expect(page.current_path).to eq new_admin_session_path
  end
end