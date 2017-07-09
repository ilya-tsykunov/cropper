class CreateEventNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :event_notifications do |t|
      t.belongs_to :user, null: false
      t.belongs_to :event, null: false
      t.boolean :watched
    end
  end
end
