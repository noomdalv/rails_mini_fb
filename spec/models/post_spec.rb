# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.create(name: 'test', email: 'test@test.com', password: 'test1234')
    @post = @user.posts.new(body: 'This is a test post')
    @no_user_post = Post.new(body: 'Test Post Two')
  end

  context 'Post Body validation'
  it 'Valid body length check' do
    expect(@post).to be_valid
  end

  it 'Invalid body length check' do
    @post = Post.new(body: 'xxx')
    expect(@post).to_not be_valid
  end

  context 'User-Post Association'
  it 'Checks for User Id' do
    expect(@no_user_post).to_not be_valid
  end
end
