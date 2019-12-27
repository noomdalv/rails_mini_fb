# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User Log Out', type: :feature do
  before :each do
    @user = User.create(name: 'noomdalv', email: 'noom@dalv.com',
                        password: '123456', password_confirmation: '123456')
    visit new_user_session_path
    fill_in('Email', with: @user.email)
    fill_in('Password', with: @user.password)
    click_button('Log in')
  end

  scenario 'Succesful User Logout' do
    click_on('Log Out')
    expect(page).to have_content('Log in')
  end
end
