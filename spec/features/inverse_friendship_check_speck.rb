# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Inverse Friendship Check', type: :feature do
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
    visit users_index_path
    click_button('Add Friend')
    expect(page).to have_content('Friendship request created!')
    click_link('Log Out')
  end

  scenario 'Check for Inverse Friendship' do
    visit new_user_session_path
    fill_in('Email', with: @user2.email)
    fill_in('Password', with: @user2.password)
    within '.actions' do
      click_button('Sign In')
    end
    expect(@user1.inverse_friendships.count).to eq 0
    visit friendships_path
    expect(page).to have_link('Accept Request')
    click_link('Accept Request')
    expect(page).to have_content('Friendship request accepted!')
    expect(@user1.inverse_friendships.count).to eq 1
  end
end
