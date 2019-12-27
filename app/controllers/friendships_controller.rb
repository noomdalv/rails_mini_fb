class FriendshipsController < ApplicationController
  def index
    @received_friendships = current_user.friend_requests
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friendship][:friend_id])
    if @friendship.save!
      flash[:success] = 'Friendship request created!'
      redirect_back fallback_location: users_path
    else
      flash[:danger] = 'Oops, something went wrong!'
      redirect_back fallback_location: users_path
    end
  end

  def destroy

  end
end
