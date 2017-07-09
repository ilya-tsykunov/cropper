class CreateEventFilters < ActiveRecord::Migration[5.1]
  def change
    create_table :event_filters do |t|
      t.belongs_to :user, index: true
      t.string :name, null: false
      t.string :city
      t.datetime :start_date_begin
      t.datetime :start_date_end
      t.belongs_to :topic

      t.timestamps
    end
  end
end
