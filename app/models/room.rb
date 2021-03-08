class Room < ApplicationRecord
  has_many :users
  has_many :room_users

  with_options presence: true do
    validates :room_name
    validates :room_url
  end
end
