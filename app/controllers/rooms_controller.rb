class RoomsController < ApplicationController
  before_action :create_url, only: :create

  def index
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    binding.pry
    @room_url = Room.select(:room_url)
    if @room.save && @room_url.save
      ridirect_to :new
    else
      render :new
    end
  end

  private
  def room_params
    params.require(:room).permit(:room_name, :room_url).merge(user_id: current_user.id)
  end

  def create_url
    @room_url = SecureRandom.urlsafe_base64(10)
  end
end
