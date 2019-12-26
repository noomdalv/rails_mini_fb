# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :name, length: { minimum: 4, maximum: 50 }, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false },
                    length: { minimum: 10, maximum: 255 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def likes?(post)
    like = Like.where('post_id = ? and user_id = ?', post.id, id)
    like.count.positive?
  end
  # returns an array of friend who are friends with a particular user.
  def friends
    friends_array = friendships.map{|friendship| friendship.friend if friendship.status}
    friends_array + inverse_friendships.map{|friendship| friendship.user if friendship.status}
    friends_array.compact
  end
  # returns
  def pending_friends
    friendships.map{|friendship| friendship.friend if !friendship.status}.compact
  end


  def friend_requests
    inverse_friendships.map{|friendship| friendship.user if !friendship.status}.compact
  end

  def confirm_friend(user)
    friendship = inverse_friendships.find{|friendship| friendship.user == user}
    friendship.status = true
    friendship.save
  end

  def friend?(user)
    friends.include?(user)
  end

end
