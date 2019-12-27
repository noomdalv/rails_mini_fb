# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user = create(:user)
    @post = Post.create(body: 'Hello world', user_id: @user.id)
    @like = Like.create(post_id: @post.id, user_id: @user.id)
  end

  context 'validation tests' do
    it 'ensures presence of user id and post_id' do
      expect(@like).to be_valid
    end

    it 'like must have user_id' do
      like = Like.new(post_id: 2).save
      expect(like).to eq(false)
    end

    it 'like must have post_id' do
      like = Like.new(user_id: 1).save
      expect(like).to eq(false)
    end
  end
end
