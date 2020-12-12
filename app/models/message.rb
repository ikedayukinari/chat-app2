class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image #Active StoraeのテーブルとMessagesテーブルのアソシエーションを定義,各レコードとファイルを1対1で紐付けるメソッド
  # has_one_attached :ファイル名
  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
