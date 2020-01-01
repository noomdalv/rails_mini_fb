# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before :each do
    @user1 = User.create(name: 'noomdalv', email: 'noom@dalv.com',
                         password: '123456', password_confirmation: '123456')
    @user2 = User.create(name: 'suman', email: 'suman@test.com',
                         password: 'abcdef', password_confirmation: 'abcdef')
    @friendship = @user1.friendships.build(friend_id: @user2.id)
  end

  context 'Friendship validation'
  it 'Valid Friendship Check' do
    expect(@friendship).to be_valid
  end
end
