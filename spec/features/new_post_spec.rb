# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User Creates New Post', type: :feature do
  before :each do
    @user = User.create(name: 'noomdalv', email: 'noom@dalv.com',
                        password: '123456', password_confirmation: '123456')
    visit new_user_session_path
    fill_in('Email', with: @user.email)
    fill_in('Password', with: @user.password)
    click_button('Log in')
  end

  scenario 'Valid Post' do
    fill_in('post[body]', with: 'Hello World')
    click_button('Post')
    expect(page).to have_current_path(posts_path)
  end

  scenario 'Invalid Post(body length)' do
    fill_in('post[body]', with: 'Hello')
    click_button('Post')
    expect(page).to have_content('Oops, Your post is not valid!')
  end
end
