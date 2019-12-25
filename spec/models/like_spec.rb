# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'validation tests' do
    it 'ensures presence of user id and post_id' do
      like = Like.new(post_id: 2, user_id: 1).save
      expect(like).to eq(true)
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
