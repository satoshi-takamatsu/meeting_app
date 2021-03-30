class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @room = Room.where(user_id: params[:id])
  end
end