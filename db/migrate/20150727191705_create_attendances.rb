class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :user_uid
      t.string :event_id

      t.timestamps null: false
    end
  end
end
