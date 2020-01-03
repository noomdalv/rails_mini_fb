# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user, presence: true
  validates :friend, presence: true, uniqueness: { scope: :user }

  def confirm_friend
    update_attributes(status: true)
    Friendship.create!(friend_id: user_id,
                       user_id: friend_id,
                       status: true)
  end
end
