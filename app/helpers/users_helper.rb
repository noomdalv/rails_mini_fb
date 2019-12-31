# frozen_string_literal: true

module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end

  def pending_requests(user)
    ids = current_user.pending_friends(user)
    ids.include?(user.id)
  end

  def friends(user)
    current_user.sent_friends.include?(user.id) || current_user.received_friends.include?(user.id) 
  end
end
