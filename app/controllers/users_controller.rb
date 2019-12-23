# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in?, only: [:index, :show]
  def show; end

  def index
    @users = User.all
  end

  private

  def logged_in?
    if current_user.nil?
      flash[:danger] = "Please login"
      redirect_to new_user_session_path
    end
  end
end
