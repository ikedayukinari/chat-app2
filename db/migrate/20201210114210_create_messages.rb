class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :room, foreign_key: true #メッセージの投稿をしたチャットルームのid、room_idカラム
      t.references :user, foreign_key: true #メッセージを投稿したユーザーのid、user_idカラム
      t.timestamps
    end
  end
end
