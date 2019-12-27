# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  after_initialize :defaults

  def defaults
    self.status = false
  end
end
