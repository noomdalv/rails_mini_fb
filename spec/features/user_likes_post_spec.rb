# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User Likes a Post', type: :feature do
  before :each do
    @user = User.create(name: 'noomdalv', email: 'noom@dalv.com',
                        password: '123456', password_confirmation: '123456')
    visit new_user_session_path
    fill_in('Email', with: @user.email)
    fill_in('Password', with: @user.password)
    within '.actions' do
      click_button('Sign In')
    end
    @post = @user.posts.build(body: 'Hello Test World')
    @post.save
  end

  scenario 'User Likes a Post' do
    visit post_path(@post)
    click_button('Like')
    expect(page).to have_button('Unlike')
  end

  scenario 'User Unlikes a Post' do
    visit post_path(@post)
    click_button('Like')
    click_button('Unlike')
    expect(page).to have_button('Like')
  end
end
