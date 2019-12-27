require 'rails_helper'

RSpec.feature 'User Sign Up', type: :feature do
  
  scenario 'Valid Sign Up' do
    visit new_user_registration_path
    fill_in 'Name', with: 'Vlad'
    fill_in 'Email', with: 'vlad@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Sign up'
    expect(page).to have_text('Welcome! You have signed up successfully')
  end

  scenario 'Invalid Sign Up(name length)' do
    visit new_user_registration_path
    fill_in 'Name', with: 'xxx'
    fill_in 'Email', with: 'xxx@xxx.com'
    fill_in 'Password', with: 'xxxxxx'
    click_button 'Sign up'
    expect(page).to have_text("Name is too short (minimum is 4 characters)")
  end
end
