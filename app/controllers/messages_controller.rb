class MessagesController < ApplicationController

  def index
    @message = Message.new #Messageモデルの空のインスタンスを渡す
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user) #チャットルーム紐づいている全てのメッセージテーブル(@room.messages)
  end #messagesテーブルはルーティングをネストしているためパスが/rooms/:room_id/messagesになっている。パスにroom_idが含まれているため[:room_id]と記述することで取り出せる

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params) #@roomで取得したチャットルームでmessages.newをしている多分
    if @message.save
      redirect_to room_messages_path(@room) #messages#indexに返して、新たにインスタンス変数を生成している
    else
      @messages = @room.messages.includes(:user) #失敗した時にも@messagesの定義がないとエラーが出る
      render :index #indexアクションのindex.html.erbを表示するようにしている。同じページに戻る
    end
  end

  private

  def message_params #roomsテーブルとネストを組んでいるのでコントローラーにきている時点でroom_idは埋まっている
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)#(room_id: params[:room_id]) @message = @room.new(message_params)の場合
  end
end
