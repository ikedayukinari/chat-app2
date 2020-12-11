class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :messages, dependent: :destroy #1つのチャットルームにメッセージはたくさんある
  
  validates :name, presence: true
end
