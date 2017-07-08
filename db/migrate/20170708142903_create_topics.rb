class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :event_topics do |t|
      t.belongs_to :event, index: true
      t.belongs_to :topic, index: true

      t.timestamps
    end
  end
end
