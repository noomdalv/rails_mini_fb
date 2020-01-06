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

  def delete_pending_request
    @friendship = current_user.friendships.find_by(friend_id: params[:friend_id])
    @friendship.destroy
    flash[:danger] = 'Friendship request cancelled.'
    redirect_back fallback_location: users_path
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:danger] = 'Friendship request rejected.'
    redirect_back fallback_location: friendships_path
  end

  def accept_request
    @friendship = Friendship.find(params[:friendship_id])
    @friendship.confirm_friend
    flash[:success] = 'Friendship request accepted!'
    redirect_to friendships_path
  end
end
