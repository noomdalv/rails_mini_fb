# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def index
    @received_friendships = current_user.friend_requests
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friendship][:friend_id])
    if @friendship.save!
      flash[:success] = 'Friendship request created!'
    else
      flash[:danger] = 'Oops, something went wrong!'
    end
    redirect_back fallback_location: users_path
  end

  def delete_request
    @friendship = Friendship.find(params[:friendship_id])
    @friendship.destroy
    flash[:danger] = 'Friend request cancelled.'
    redirect_back fallback_location: friendships_path
  end

  def accept_request
    @friend = User.find(params[:friend])
    current_user.confirm_friend(@friend)
    flash[:success] = 'Friendship request accepted!'
    redirect_to friendships_path
  end
end
