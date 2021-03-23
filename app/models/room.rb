class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users

  with_options presence: true do
    validates :room_name
  end
end
