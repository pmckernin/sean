class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :sender_uid
      t.string :recipient_uid
      t.string :event_id

      t.timestamps null: false
    end
  end
end
