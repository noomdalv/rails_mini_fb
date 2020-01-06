# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :body, presence: true, length: { minimum: 1, maximum: 1000 }
  default_scope { order('created_at DESC') }
end
