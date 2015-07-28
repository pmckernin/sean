class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :event_id
      t.string :user_uid
      t.text :content

      t.timestamps null: false
    end
  end
end
