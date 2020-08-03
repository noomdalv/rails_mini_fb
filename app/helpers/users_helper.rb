# frozen_string_literal: true

module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user, size)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    return gravatar_url
  end

  def pending_requests(user)
    ids = current_user.pending_friends(user)
    ids.include?(user.id)
  end

  def friends(user)
    current_user.friends.include?(user.id)
  end

  def friend_profiles
    ids = current_user.friends
    User.where(id: ids)
  end
end
