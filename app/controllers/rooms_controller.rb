class RoomsController < ApplicationController

  def index
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      render :new
    else
      render :new
    end
  end

  private
  def room_params
    params.require(:room).permit(:room_name, :room_url).merge(user_id: current_user.id)
  end

end
