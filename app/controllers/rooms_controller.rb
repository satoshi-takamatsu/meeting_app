class RoomsController < ApplicationController
  before_action :create_url, only: :create

  def index
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to new_room_path
    else
      render :new
    end
  end

  private
  def room_params
    params.require(:room).permit(:room_name, :room_url).merge(user_id: current_user.id, room_url: @room_url)
  end

  def create_url
    @room_url = SecureRandom.urlsafe_base64(10)
  end
end
