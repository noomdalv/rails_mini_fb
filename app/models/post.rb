# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :body, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :user_id, presence: true
  default_scope { order('created_at DESC') }
end
