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

  def delete_request
     @friendship = Friendship.find(params[:friendship_id])
     @friendship.destroy
     flash[:danger]= "Friend request cancelled."
     redirect_back fallback_location: friendships_path

  end

  def accept_request
   @friend = User.find(params[:friend_o])
   current_user.confirm_friend(@friend)
   redirect_to friendships_path
  end

end
