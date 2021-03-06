class RoomsController < ApplicationController

  def index
  end

  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
     if @room.save
      redirect_to root_path
     else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  private
  def room_params
    params.require(:room).permit(:name, user_ids: []) #permitに注目
  end #配列に対して保存を許可したい場合は、user_ids: というキーに対して、[]を値として記述する
end
