# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User Creates Comment', type: :feature do
  before :each do
    @user = User.create(name: 'noomdalv', email: 'noom@dalv.com',
                        password: '123456', password_confirmation: '123456')
    visit new_user_session_path
    fill_in('Email', with: @user.email)
    fill_in('Password', with: @user.password)
    click_button('Log in')
    @post = @user.posts.build(body: 'Hello Test World')
    @post.save
  end

  scenario 'Valid Comment' do
    visit post_path(@post)
    fill_in('comment[body]', with: 'This is a valid test comment')
    click_button('Comment')
    expect(page).to have_content('Comment successfully created')
  end

  scenario 'Invalid Comment' do
    visit post_path(@post)
    fill_in('comment[body]', with: '')
    click_button('Comment')
    expect(page).to have_content('Oops!! Your comment is Empty')
  end
end
