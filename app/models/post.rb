# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :body, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :user_id, presence: true
  default_scope { order('created_at DESC') }
end
