class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

# ここに保存するユーザーとチャットグループは必ず存在しているので、他テーブルであるusersテーブルとroomsテーブルの情報を参照する必要がある
# この参照する役割をはたすのがforeign_key: true