class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.string :sender_uid
      t.string :reciever_uid
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end
