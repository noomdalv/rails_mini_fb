# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Friendship Request', type: :feature do
  before :each do
    @user1 = User.create(name: 'noomdalv', email: 'noom@dalv.com',
                         password: '123456', password_confirmation: '123456')
    @user2 = User.create(name: 'suman', email: 'suman@test.com',
                         password: 'abcdef', password_confirmation: 'abcdef')
    visit new_user_session_path
    fill_in('Email', with: @user1.email)
    fill_in('Password', with: @user1.password)
    within '.actions' do
      click_button('Sign In')
    end
  end

  scenario 'user1 sends friendship request to user2' do
    visit users_index_path
    click_button('Add Friend')
    expect(page).to have_content('Friendship request created!')
  end

  scenario 'user1 accepts friend request from user2' do
    @friendship = @user2.friendships.build(friend_id: @user1.id)
    @friendship.save
    visit friendships_path
    expect(page).to have_link('Accept Request')
    click_link('Accept Request')
    expect(page).to have_content('Friendship request accepted!')
  end
end
