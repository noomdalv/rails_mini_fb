# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User Log In', type: :feature do
  before :each do
    @user = User.create(name: 'noomdalv', email: 'noom@dalv.com',
                        password: '123456', password_confirmation: '123456')
  end

  scenario 'Valid Log In' do
    visit new_user_session_path
    fill_in('Email', with: @user.email)
    fill_in('Password', with: @user.password)
    click_button('Log in')
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'Invalid Log In' do
    visit new_user_session_path
    fill_in('Email', with: 'xxx')
    fill_in('Password', with: @user.password)
    click_button('Log in')
    expect(page).to have_content('Invalid Email or password.')
  end
end
