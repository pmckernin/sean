class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :invite_only
      t.string :creator_uid
      t.string :location

      t.timestamps null: false
    end
  end
end
