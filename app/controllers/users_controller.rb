# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in?, only: %i[index show]
  def show; end

  def index
    @users = User.all
  end
end
