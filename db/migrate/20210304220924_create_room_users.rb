class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      # t.references :user,      foreign_key: true
      # t.references :room,      foreign_key: true
      t.integer :user_id,        foreign_key: true
      t.integer :room_id,        foreign_key: true
      t.timestamps
    end
  end
end
