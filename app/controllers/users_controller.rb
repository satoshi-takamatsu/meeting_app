class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @rooms = @user.rooms.includes(:user).order("created_at DESC")
    @rooms = @user.rooms
  end
end